import requests, json, os
server = 'https://wanz-6124a-default-rtdb.firebaseio.com/kms_food_ordering_system/foods.json'

while True:
	name = input("Name: ")
	pic = input("Pic: ")
	price = input("Price: ")
	get_length = requests.get(server).json()

	next_id = len(get_length)

	payload = {
		str(next_id):	{
			"name": str(name),
			"pic": str(pic),
			"price": int(price),
			"vendor": "KMS Cafe"
		}
	}


	requests.patch(server, data = json.dumps(payload))
	os.system('cls')

