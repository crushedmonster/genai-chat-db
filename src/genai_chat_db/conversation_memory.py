class ConversationMemory:
    def __init__(self):
        self.memory = {}

    def store(self, session_id: str, sql_query: str, user_question: str, schema_info, relation_info):
        self.memory[session_id] = {"sql_query": sql_query, 
                                   "user_question": user_question,
                                   "schema_info": schema_info,
                                   "relation_info": relation_info
                                   }

    def retrieve(self, session_id: str):
        return self.memory.get(session_id, None)

    def clear(self, session_id: str):
        if session_id in self.memory:
            del self.memory[session_id]
