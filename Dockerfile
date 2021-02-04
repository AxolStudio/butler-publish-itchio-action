FROM centos:8

ARG INPUT

LABEL "com.github.actions.name"="Butler Push"
LABEL "com.github.actions.description"="Publishes releases to Itch.io using Butler"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="white"

RUN dnf install unzip -y

RUN "echo BUTLER_VER: $BUTLER_VER"
RUN "echo $BUILDOS"

# Install Butler
RUN "curl -L -o butler.zip https://broth.itch.ovh/butler/${BUTLER_VER}/LATEST/archive/default" \
    && unzip butler.zip \
    && cp butler /usr/bin \
    && chmod +x /usr/bin/butler

# Run butler push
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
