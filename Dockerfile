FROM centos:8

LABEL "com.github.actions.name"="Butler Push"
LABEL "com.github.actions.description"="Publishes releases to Itch.io using Butler"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="white"

# Run butler push
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
