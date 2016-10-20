import json
import platform
import ConfigParser
from cm_api.api_client import ApiResource

hostname = platform.uname()[1]

config = ConfigParser.ConfigParser()
config.read('config.txt')

manager  = config.get('api','manager')
port     = config.get('api','port')
username = config.get('api','username')
password = config.get('api','password')

api = ApiResource(manager, port, username, password)

for h in api.get_all_hosts():
    if hostname == h.hostname:
        thishost = h
print thishost.hostname
print thishost.hostId
print thishost.hostUrl

