# A configuration file for the asyncio proxy herd

# Google Places API key
API_KEY="AIzaSyCZJRCVMIhkUL5xNJMT3Dtm1A_J6Y-brFs"
# Google Places Nearby API Endpoint
API_ENDPOINT = '/maps/api/place/nearbysearch/json?'
API_HOST = 'maps.googleapis.com'

# TCP port numbers for each server instance
PORT_NUM = {
    'Goloman': 18595,
    'Hands': 18596,
    'Holiday': 18597,
    'Wilkes': 18598,
    'Welsh': 18599
 }

NEIGHBORS = {
	'Goloman'= ['Hands', 'Holiday', 'Wilkes']
	'Hands'= ['Goloman', 'Wilkes']
	'Holiday'= ['Goloman', 'Wilkes', 'Welsh']
	'Wilkes'= ['Hands', 'Holiday', 'Goloman']
	'Welsh'= ['Holiday']
}

HTTPS_PORT = 443

SERVER_HOST = '127.0.0.1'