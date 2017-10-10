FROM node:6.11.3
MAINTAINER hello@menzo.io

ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV SDK_VERSION 127.0.0
ENV SDK_FILENAME google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz

RUN /bin/bash gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
	curl -sSL https://get.rvm.io -o rvm.sh && \
	cat rvm.sh | bash -s stable && \
	/bin/bash -c "source ~/.rvm/scripts/rvm && rvm install ruby --default && gem install compass"
	curl -O -J https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${SDK_FILENAME} && \
	tar -zxvf ${SDK_FILENAME} --directory ${HOME} && \
	rm ${SDK_FILENAME}

ENV PATH $PATH:/root/google-cloud-sdk/bin

CMD [ "node" ]
