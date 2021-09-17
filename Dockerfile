FROM ubuntu:focal

WORKDIR /opt/birthday

# install dependencies
RUN apt-get update \
    && apt-get install -y busybox-static python3 default-jre-headless \
    && rm -rf /var/lib/apt/lists/* \
    && busybox --install -s

# install signal-cli: https://github.com/AsamK/signal-cli
RUN wget https://github.com/AsamK/signal-cli/releases/download/v0.9.0/signal-cli-0.9.0.tar.gz
RUN tar xf signal-cli-0.9.0.tar.gz -C /opt
RUN ln -sf /opt/signal-cli-0.9.0/bin/signal-cli /usr/local/bin/

# create user
RUN groupadd -r -g 1000 bot && useradd --no-log-init -r -m -g bot -u 1000 bot

# add files
COPY . .

# set up cron job (every day at 12:00)
RUN mkdir -p /var/spool/cron/crontabs
RUN crontab -u bot cron

VOLUME "/opt/birthday/BirthdaySignal.csv" "/home/bot/.local/share/signal-cli/data"
CMD crond -f -L /dev/stdout
