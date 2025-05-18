"""
Logging module for the GenAI Chat DB application.
"""

import sys
import logging

from genai_chat_db.config import SETTINGS

def setup_logger():
    """
    Setup logging for the GenAI Chat DB application.

    Logs are written to standard output (stdout) in the format:
    [timestamp] - [log level] - [log message]

    Log Level:
    - Logs are captured at the level specified by `Settings.LOG_LEVEL`.

    Example:
        setup_logger() will initialise the logger and log the "Logger initialised" message.
    """
    # Create logger
    logger = logging.getLogger()
    logger.setLevel(SETTINGS.LOG_LEVEL)

    # If logger has already been configured, avoid re-initialising
    if logger.hasHandlers():
        return

    # StreamHandler for stdout (useful for container logging)
    stream_handler = logging.StreamHandler(sys.stdout)
    stream_handler.setLevel(SETTINGS.LOG_LEVEL)

    # Log formatter with timestamp, log level, and message
    formatter = logging.Formatter(
        "%(asctime)s - %(levelname)s - %(message)s",
        datefmt=SETTINGS.LOG_TIME_FORMAT
    )
    stream_handler.setFormatter(formatter)

    logger.addHandler(stream_handler)

    logging.info("Logger initialised. Logging started.")
