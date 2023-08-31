FROM mediawiki

RUN apt-get update && apt-get install vim -y

EXPOSE 8080