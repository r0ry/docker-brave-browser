FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get install -qqy x11-apps -y\
    && apt-get install curl -y \
    && apt-get install apt-transport-https curl -y \
    && curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list \
    && apt-get update \
    && apt-get install brave-browser -y\
    && useradd --create-home browser

USER browser
VOLUME /home/browser

CMD ["brave-browser", "--no-sandbox"]