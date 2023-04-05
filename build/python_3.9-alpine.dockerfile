FROM python:3.9-alpine

# TAG=3.9

LABEL author="baterflyrity"
LABEL mail="baterflyrity@yandex.ru"
LABEL home="https://github.com/baterflyrity/python-autostart"
LABEL version="1.1.0"
LABEL description="Image with commands executed on container start."

COPY autostart.sh /autostart.sh
COPY autostart.py /autostart.py

ENTRYPOINT ["/autostart.sh"]
CMD ["/usr/bin/env", "sh"]
