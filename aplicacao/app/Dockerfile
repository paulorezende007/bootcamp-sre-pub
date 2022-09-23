FROM python:3.7
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app/
ARG\
  DD_HOSTNAME\
  DD_AGENT_MAJOR_VERSION\
  DD_API_KEY\
  DD_SITE\
  DD_SERVICE\
  DD_ENV\
  DD_LOGS_INJECTION
ENV\
  TERM=xterm\
  PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin\
  TZ=America/Sao_Paulo\
  USER=root\
  HOME=/root\
  SHLVL=2\
  SHELL=/bin/bash\
  DEBIAN_FRONTEND=noninteractive\
  DEBCONF_NONINTERACTIVE_SEEN=true\
  DD_HOSTNAME=$DD_HOSTNAME\
  DD_AGENT_MAJOR_VERSION=$DD_AGENT_MAJOR_VERSION\
  DD_API_KEY=$DD_API_KEY\
  DD_SITE=$DD_SITE\
  DD_SERVICE=$DD_SERVICE\
  DD_ENV=$DD_ENV\
  DD_LOGS_INJECTION=$DD_LOGS_INJECTION
RUN\
  (apt -yqqqqq update) >/dev/null 2>&1;\
  (apt -yqqqqq full-upgrade) >/dev/null 2>&1;\
  (apt -yqqqqq install apt-transport-https curl gnupg) >/dev/null 2>&1;\
  (pip3 install --upgrade --no-cache-dir -r requirements.txt) >/dev/null 2>&1;\
  (bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)") >/dev/null 2>&1;
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
EXPOSE 8000
#:END
