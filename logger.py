import logging

def setup_logger(name='ia_netmsg', level='INFO'):
    logger = logging.getLogger(name)
    logger.setLevel(level)
    handler = logging.FileHandler('server.log')
    formatter = logging.Formatter('[%(asctime)s] %(levelname)s: %(message)s')
    handler.setFormatter(formatter)
    logger.addHandler(handler)
    return logger
