import re
import streamlit as st

from genai_chat_db.natural_language_query_engine import NaturalLanguageQueryEngine
from genai_chat_db.utils.logger import setup_logger


# --- Page Configuration ---
st.set_page_config(page_title="Database Assistant", page_icon="🤖")

# --- Minimal CSS Styling ---
def add_custom_css():
    """Add minimal custom CSS to style the Streamlit interface.
    """
    st.markdown("""
    <style>
        .stApp {
            max-width: 1000px;
            margin: 0 auto;
        }
        div.stButton > button {
            background-color: #eef2f7;
            border: 1px solid #d0d7de;
            border-radius: 10px;
            padding: 8px 12px;
            margin-bottom: 8px;
            font-size: 0.85rem;
            color: #333333;
            text-align: left;
            width: 100%;
        }
        div.stButton > button:hover {
            background-color: #dce4ef;
            border: 1px solid #c2c8d0;
        }
    </style>
    """, unsafe_allow_html=True)

# --- Helper Functions ---
def escape_markdown_specials(text: str) -> str:
    """Escape special characters to prevent markdown rendering issues.
    """
    if not isinstance(text, str):
        return str(text)

    text = text.replace('$', '\\$').replace('%', '\\%')
    text = re.sub(r'(?<!\\)_', r'\_', text)
    return text

def original_session_state_message():
    """
    Set streamlit session state's message.
    """
    st.session_state.messages = [
            {
                "role": "assistant",
                "content": "Hi! I'm your Database Assistant. Ask me anything about your data!",
            }
        ]

def clear_chat():
    """Button to reset chat history.
    """
    if st.sidebar.button("🗑️ Reset Chat", use_container_width=True):
        original_session_state_message()

@st.cache_resource
def get_query_engine_instance() -> NaturalLanguageQueryEngine:
    """Initialise and cache the query engine.
    """
    return NaturalLanguageQueryEngine()

def generate_response(user_input: str, query_engine_obj: NaturalLanguageQueryEngine):
    """Generate assistant's response for a given user input.
    """
    with st.spinner("Generating answer..."):
        try:
            sql_query, model_message = query_engine_obj.prompt_sql_command(user_input)
            if not sql_query.strip():
                return model_message or "❓ Unable to generate a valid SQL for your question."

            results, error_message = query_engine_obj.execute_sql_command(sql_query)
            if results is None:
                return error_message or "⚠️ SQL execution failed or blocked by guardrails."

            summary = query_engine_obj.get_summary(
                user_input, results, sql_query, model_message
            )

            return {
                "sql_query": sql_query,
                "summary": summary,
                "results": results,
            }

        except Exception as e:
            return f"❌ Error:\n\n`{e}`\n\nPlease try again."

# --- UI Components ---
def render_sidebar():
    """Render the sidebar with example questions.
    """
    st.sidebar.header("Try an example:")
    example_questions = [
        "Who are the top 10 customers by total purchases?",
        "What are the most frequently ordered product categories?",
        "Which shipping company handles the most orders?",
        "Average shipping time per shipping company?"
    ]

    if "example_clicked" not in st.session_state:
        st.session_state.example_clicked = None

    for idx, question in enumerate(example_questions):
        if st.sidebar.button(question, key=f"example_{idx}"):
            st.session_state.example_clicked = question

    st.sidebar.divider()
    clear_chat()

    st.sidebar.caption("genai-chat-db v0.0.1")

def display_chat_messages():
    """Render the chat history.
    """
    for message in st.session_state.messages:
        with st.chat_message(message["role"]):
            content = message["content"]
            if isinstance(content, str):
                st.write(content)
            elif isinstance(content, dict):
                if sql := content.get("sql_query"):
                    st.markdown("**SQL Query:**")
                    st.code(sql, language="sql")
                if summary := content.get("summary"):
                    st.markdown("**Summary:**")
                    safe_summary = escape_markdown_specials(summary)
                    st.write(safe_summary)
                if results := content.get("results"):
                    st.markdown("**Results:**")
                    st.dataframe(results, use_container_width=True)
                    st.caption(f"Showing {len(results)} results.")


def handle_new_user_input(query_engine_obj: NaturalLanguageQueryEngine):
    """Handle user input from the chat input box.
    """
    if user_prompt := st.chat_input("Ask a question about your database..."):
        st.session_state.messages.append({"role": "user", "content": user_prompt})

        with st.chat_message("user"):
            st.write(user_prompt)

        with st.chat_message("assistant"):
            assistant_response= generate_response(user_prompt, query_engine_obj)

            if isinstance(assistant_response, str):
                st.write(assistant_response)
            else:
                if sql := assistant_response.get("sql_query"):
                    st.markdown("**SQL Query:**")
                    st.code(sql, language="sql")
                if summary := assistant_response.get("summary"):
                    st.markdown("**Summary:**")
                    safe_summary = escape_markdown_specials(summary)
                    st.write(safe_summary)
                if results := assistant_response.get("results"):
                    st.markdown("**Results:**")
                    st.dataframe(results, use_container_width=True)
                    st.caption(f"Showing {len(results)} results.")

        st.session_state.messages.append({"role": "assistant", "content": assistant_response})


def handle_example_click(query_engine_obj: NaturalLanguageQueryEngine):
    """Handle when an example question is clicked.
    """
    if st.session_state.example_clicked:
        user_prompt = st.session_state.example_clicked
        st.session_state.example_clicked = None

        st.session_state.messages.append({"role": "user", "content": user_prompt})
        assistant_response = generate_response(user_prompt,query_engine_obj)
        st.session_state.messages.append({"role": "assistant", "content": assistant_response})

# --- Main App ---
def main() -> None:
    """Run the main application.
    """
    setup_logger()
    add_custom_css()

    st.title("Chat with your data")
    st.caption("Powered by Azure OpenAI + AI Search")

    render_sidebar()

    if "messages" not in st.session_state:
        original_session_state_message()

    engine = get_query_engine_instance()
    handle_example_click(engine)
    display_chat_messages()
    handle_new_user_input(engine)

# --- Run the App ---
if __name__ == "__main__":
    main()
