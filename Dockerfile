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
RUN npm install cordova -g

# Don't agree to be tracked
RUN yes n | cordova

# Warm up cordovas depenecies (gradle etc.)
RUN cordova create myApp org.apache.cordova.myApp myApp \
	&& cd myApp \
	&& cordova platform add android \
	&& cordova build \
	&& cd .. \
	&& rm -rf myApp

USER build
