FROM thomasnordquist/docker-android-build-environment

USER root

# Add nodejs v7.0 packet source
RUN apt-get update \
        && apt-get -y --no-install-recommends install curl \
	&& curl -sL https://deb.nodesource.com/setup_7.x | bash - \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update \
	&& apt-get update \
	&& apt-get -y --no-install-recommends install \
		build-essential \
		nodejs \
		&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN npm install -g \
        cordova \
        yarn \
    && npm cache clean

USER jenkins

