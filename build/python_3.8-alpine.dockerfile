FROM python:3.8-alpine

# TAG=3.8-alpine

LABEL author="baterflyrity"
LABEL mail="baterflyrity@yandex.ru"
LABEL home="https://github.com/baterflyrity/python-autostart"
LABEL version="1.1.1"
LABEL description="Image with commands executed on container start."

COPY autostart.sh /autostart.sh
COPY autostart.py /autostart.py

ENTRYPOINT ["/autostart.sh"]
CMD ["/usr/bin/env", "sh"]
