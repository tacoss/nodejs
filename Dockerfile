FROM shivjm/node-chromium-alpine:14

LABEL version="0.0.3"
LABEL repository="https://github.com/tacoss/nodejs"
LABEL homepage="https://github.com/tacoss/nodejs"
LABEL maintainer="Alvaro Cabrera <pateketrueke@gmail.com>"

LABEL com.github.actions.name="NPM support with Makefile and Chrome (headless)"
LABEL com.github.actions.description="LTS npm with access to Chrome for use on E2E-testing"
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="green-dark"

RUN apk add --no-cache make bash curl git gcompat jq openssh-client python3 g++

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["true"]
