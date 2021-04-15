from datetime import datetime
import csv
import os

currentDate = datetime.today().strftime('%Y-%m-%d')

import csv
with open('BirthdaySignal.csv', 'r') as file:
	reader = csv.reader(file, delimiter=';')
	for row in reader:
		if(row[2] == currentDate):
			message = 'Alles Gute zum Geburtstag' +  {row[1]} + 
			'! 🎉🎂 Wir wünschen dir einen schönen Tag und weiterhin eine positive Erfahrung bei uns im Verein. 😊'
			os.system('signal-cli -u <yourNumber> send -m ' + message + row[0])
