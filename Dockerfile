FROM rabbitmq:3.7-management-alpine

RUN apk add --update \
    curl \
    unzip \
    && rm -rf /var/cache/apk/*
RUN curl -sf -o rabbitmq_delayed_message_exchange-20171201-3.7.x.zip -L https://dl.bintray.com/rabbitmq/community-plugins/3.7.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip \
    && unzip -o rabbitmq_delayed_message_exchange-20171201-3.7.x.zip \
    && rm rabbitmq_delayed_message_exchange-20171201-3.7.x.zip \
    && mv rabbitmq_delayed_message_exchange-20171201-3.7.x.ez /opt/rabbitmq/plugins/
RUN rabbitmq-plugins enable --offline rabbitmq_web_stomp rabbitmq_delayed_message_exchange
