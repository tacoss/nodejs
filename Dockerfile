FROM node:24-alpine

LABEL version="0.0.5"
LABEL repository="https://github.com/tacoss/nodejs"
LABEL homepage="https://github.com/tacoss/nodejs"
LABEL maintainer="Alvaro Cabrera <pateketrueke@gmail.com>"

LABEL com.github.actions.name="NPM support with Makefile and Chrome (headless)"
LABEL com.github.actions.description="LTS npm with access to Chrome for use on E2E-testing"
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="green-dark"

RUN apk add --no-cache make bash curl git gcompat libc6-compat jq openssh-client python3 g++ libsoup3 libsoup3-dev gtk4.0 gjs

RUN apk update && apk upgrade && \
    apk add --no-cache chromium nss xvfb freetype mesa-gl libstdc++ udev openrc

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["true"]
