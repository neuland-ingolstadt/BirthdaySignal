from datetime import datetime
import csv
import os

currentDate = datetime.today().strftime('%m-%d')

with open('BirthdaySignal.csv', 'r') as file:
	reader = csv.reader(file, delimiter=';')
	for row in reader:
		if row[2] == currentDate and row[1].isalpha() and row[0][1:].isdecimal() and row[0][0] == '+':
			message = '\'Alles Gute zum Geburtstag ' +  row[1] + '! 🎉🎂 Wir wünschen dir einen schönen Tag und weiterhin eine positive Erfahrung bei uns im Verein. 😊 Dein Team von Neuland Ingolstadt e.V.\''
			os.system('signal-cli -u +49<TelephonenumberSender> send -m ' + message + ' ' + row[0])
