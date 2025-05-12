from pathlib import Path


class PromptLoader:
    """
    A utility class for loading and formatting prompt templates from files.
    """
    @staticmethod
    def load_prompt(prompt_name: str) -> str:
        """
        Load the content of a prompt from a file.

        Args:
            prompt_name (str): The name of the prompt file to load.

        Returns:
            str: The content of the loaded prompt file.

        Raises:
            FileNotFoundError: If the prompt file is not found in the 'prompts' directory.
            Exception: If any other error occurs during file reading.
        """
        prompt_path = Path(__file__).parent.parent / 'prompts' / prompt_name
        try:
            with open(prompt_path, "r", encoding="utf-8") as f:
                return f.read()
        except FileNotFoundError:
            raise FileNotFoundError(f"Prompt file '{prompt_name}' not found in 'prompts' directory.")
        except Exception as e:
            raise Exception(f"Error loading prompt '{prompt_name}': {str(e)}")

    @staticmethod
    def format_prompt(template: str, **kwargs) -> str:
        """
        Format the prompt template using dynamic keyword arguments.

        Args:
            template (str): The prompt template string containing placeholders.
            **kwargs: Key-value pairs used to replace placeholders in the template.

        Returns:
            str: The formatted prompt with placeholders replaced.

        Raises:
            KeyError: If a required placeholder is missing in the arguments.
            Exception: If any other error occurs during formatting.
        """
        try:
            return template.format(**kwargs)
        except KeyError as e:
            raise KeyError(f"Missing placeholder for: {e}")
        except Exception as e:
            raise Exception(f"Error formatting prompt: {str(e)}")
