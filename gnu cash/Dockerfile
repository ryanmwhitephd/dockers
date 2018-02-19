FROM ubuntu:17.10

ENV DEBIAN_FRONTEND interactive
RUN apt-get update -q && apt-get install -y gnucash dbus-x11
ENTRYPOINT ["/usr/bin/gnucash", "--logto", "stderr"]
