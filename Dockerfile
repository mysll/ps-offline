FROM alpine

WORKDIR /var/run/photopea

RUN apk update && apk upgrade

RUN apk add git python3

RUN git clone  --progress --verbose https://git.nixnet.services/DUOLabs333/Photopea-Offline.git . \
    && python3 Updater.py --fonts

EXPOSE 8887

ENTRYPOINT ["python3", "-m", "http.server", "--directory", "www.photopea.com", "8887"]