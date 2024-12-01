FROM docker.io/amd64/debian:bookworm

RUN echo 'Installing' \
	&& DEBIAN_FRONTEND=noninteractive apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends pandoc php-cli php-xml php-curl unzip composer \
	&& apt-get clean -q \
	&& rm -Rf /var/lib/apt/lists/*
RUN useradd --uid 1000 --home-dir /src --create-home convert && mkdir /data
ADD --chmod=0644 composer.json convert.php /src
USER 1000
RUN cd /src && composer install --no-cache
WORKDIR /data
ENTRYPOINT ["php", "/src/convert.php"]
VOLUME ["/data"]
