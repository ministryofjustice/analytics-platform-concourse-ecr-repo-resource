FROM mesosphere/aws-cli

RUN apk --no-cache add jq

COPY resource /opt/resource
RUN chmod +x /opt/resource/check /opt/resource/in /opt/resource/out
