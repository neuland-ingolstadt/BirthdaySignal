from datetime import datetime
import csv
import os

currentDate = datetime.today().strftime('%Y-%m-%d')

import csv
with open('BirthdaySignal.csv', 'r') as file:
	reader = csv.reader(file, delimiter=';')
	for row in reader:
		if(row[2] == currentDate):
			message = '"Alles Gute zum Geburtstag ' +  row[1] + '! 🎉🎂 Wir wünschen dir einen schönen Tag und weiterhin eine positive Erfahrung bei uns im Verein. 😊 Dein Team von Neuland Ingolstadt e.V."'
			message = "'" + message.replace("'", "'\\''") + "'"
			os.system('./signal-cli-0.8.1/bin/signal-cli -u +49<TelephonenumberSender> send -m ' + message + ' ' + row[0])
