FROM thomasnordquist/docker-android-build-environment

USER root
RUN apt-get update \
	&& apt-get -y --no-install-recommends install \
		nodejs \
		npm \
		&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Create symlink so that cordova can find the node binary
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g \
	cordova \
	yarn

# Don't agree to be tracked
RUN yes n | cordova

USER jenkins
