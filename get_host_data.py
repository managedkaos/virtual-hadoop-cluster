import platform
import ConfigParser
from cm_api.api_client import ApiResource

config = ConfigParser.ConfigParser()
config.read('config.txt')

manager  = config.get('api','manager')
port     = config.get('api','port')
username = config.get('api','username')
password = config.get('api','password')

api = ApiResource(manager, port, username, password)

for h in api.get_all_hosts():
    print h.__dict__
