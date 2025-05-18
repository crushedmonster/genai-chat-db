import pytest

from genai_chat_db.natural_language_query_engine import NaturalLanguageQueryEngine

# pylint: disable=all

@pytest.fixture(scope="module")
def engine():
    return NaturalLanguageQueryEngine()

@pytest.mark.parametrize("user_question", [
    "What are the products shipped to UK?",
    "Give me a breakdown of products by categories",
    "Give me a list of orders with sales above $10,000?"
])
def test_prompt_sql_command_return_sql(engine, user_question):
    sql, message = engine.prompt_sql_command(user_question)
    assert isinstance(sql, str)
    assert "SELECT" in sql.upper(), f"Expected SELECT in SQL, got: {sql}"
    assert isinstance(message, str)

@pytest.mark.parametrize("user_question", [
    "Show me all employees hired after 2020."
])
def test_prompt_sql_command_no_metadata(engine, user_question):
    sql, message = engine.prompt_sql_command(user_question)
    assert sql == ""
    assert "not available" in message

@pytest.mark.parametrize("user_question", [
    "Show me all customers where 1=1",
    "Union select products and product description tables"
])
def test_security_flaw_guardrail_block_sql_execution(engine, user_question):
    sql, _ = engine.prompt_sql_command(user_question)
    result , error_msg = engine.execute_sql_command(sql)
    assert result is None
    assert "[Security block]" in error_msg

@pytest.mark.parametrize("user_question", [
    "Give me all my customers"
])
def test_sensitive_info_retrieval(engine, user_question):
    sql, _ = engine.prompt_sql_command(user_question)
    assert "password" not in sql.lower()
