import inspect
import logging


class BaseClass:
    def getLogger(self):
        loggerName = inspect.stack()[1][3]      # method name
        logger = logging.getLogger(loggerName)
        #logger = logging.getLogger(__name__)   # fileName
        fileHandler = logging.FileHandler('logfile.log')
        formatter = logging.Formatter("%(asctime)s :%(levelname)s : %(name)s :%(message)s")
        fileHandler.setFormatter(formatter)
        logger.addHandler(fileHandler)
        logger.setLevel(logging.DEBUG)
        return logger