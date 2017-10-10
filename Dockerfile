FROM ruby:2.4.1
MAINTAINER hello@menzo.io



RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get update -qq && apt-get install -y build-essential nodejs && \
    gem install compass && \
    apt-get clean


ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV SDK_VERSION 127.0.0
ENV SDK_FILENAME google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz

RUN curl -O -J https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${SDK_FILENAME} && \
	tar -zxvf ${SDK_FILENAME} --directory ${HOME} && \
	rm ${SDK_FILENAME}

ENV PATH $PATH:/root/google-cloud-sdk/bin

CMD [ "node" ]
