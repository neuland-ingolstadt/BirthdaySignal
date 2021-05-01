FROM alpine:3.13

WORKDIR /opt/birthday

RUN echo "@community https://dl-cdn.alpinelinux.org/alpine/v3.13/community" >> /etc/apk/repositories
RUN apk add --no-cache python3 openjdk11-jre

RUN echo "0 12 * * * cd /opt/birthday && python3 BirthdaySignal.py" | crontab -

COPY . .

VOLUME ["/opt/birthday/BirthdaySignal.csv", "/root/.local/share/signal-cli/data"]
CMD ["crond", "-f", "-d", "8"]
