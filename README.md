# BirthdaySignal
A Signal Bot to never forget a birthday.

1. Download the Repository
2. Run signal-cli config in the Terminal (credit https://github.com/AsamK/signal-cli)
   ```
   ./signal-cli -u +49<TelephonenumberSender> register
   ./signal-cli -u +49<TelephonenumberSender> verify <SecurityCode>
   ./signal-cli -u +49<TelephonenumberSender> send -m “Hello World” +49<TelephonenumberReciever>
   ```
3. Change the ```+49<TelephonenumberSender>``` in BirthdaySignal.py
4. Generate a CVS with the format <Telefonnummer>,<Name>,<%m-%d> and call it BirthdaySignal.csv
   ```
   +4912345678910;Jen;04-22
   +4912345678910;Dieter;04-22
   ```
5. Make a cronjob that runs BirthdaySignal.py once a day
