FROM debian:10-slim

RUN set -xe; \
	# Install dependencies
	apt-get update >/dev/null; \
	apt-get -y install >/dev/null \
		curl \
		unzip \
	; \
	# Cleanup
	apt-get clean; rm -rf /var/lib/apt/lists/*

RUN  set -xe; \
	# Install awscliv2
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
	unzip -q awscliv2.zip; \
	./aws/install; \
	# Cleanup
	rm -rf awscliv2.zip aws

ENTRYPOINT ["aws"]
