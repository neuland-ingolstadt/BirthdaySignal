FROM alpine:3.13

WORKDIR /opt/birthday

# install dependencies
RUN echo "@community https://dl-cdn.alpinelinux.org/alpine/v3.13/community" >> /etc/apk/repositories
RUN apk add --no-cache python3 openjdk11-jre-headless

# install signal-cli: https://github.com/AsamK/signal-cli
RUN wget https://github.com/AsamK/signal-cli/releases/download/v0.8.1/signal-cli-0.8.1.tar.gz
RUN tar xf signal-cli-0.8.1.tar.gz -C /opt
RUN ln -sf /opt/signal-cli-0.8.1/bin/signal-cli /usr/local/bin/

# set up cron job (every day at 12:00)
RUN echo "0 12 * * * cd /opt/birthday && python3 BirthdaySignal.py" | crontab -

COPY . .

VOLUME "/opt/birthday/BirthdaySignal.csv" "/root/.local/share/signal-cli/data"
CMD ["crond", "-f", "-d", "8"]
