FROM mhart/alpine-node:12

LABEL version="0.0.1"
LABEL repository="https://github.com/tacoss/nodejs"
LABEL homepage="https://github.com/tacoss/nodejs"
LABEL maintainer="Alvaro Cabrera <pateketrueke@gmail.co>"

LABEL com.github.actions.name="NPM support with Makefile and Chrome (headless)"
LABEL com.github.actions.description="LTS npm with access to Chrome for use on E2E-testing"
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="green-dark"

RUN apk update && apk upgrade && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    apk add --no-cache make \
      chromium@edge \
      nss@edge \
      harfbuzz@edge \
      freetype@edge \
      ttf-freefont@edge

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
