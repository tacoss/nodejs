FROM rastasheep/alpine-node-chromium

LABEL version="0.0.1"
LABEL repository="https://github.com/tacoss/nodejs"
LABEL homepage="https://github.com/tacoss/nodejs"
LABEL maintainer="Alvaro Cabrera <pateketrueke@gmail.co>"

LABEL com.github.actions.name="NPM support with Makefile and Chrome (headless)"
LABEL com.github.actions.description="LTS npm with access to Chrome for use on E2E-testing"
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="green-dark"

RUN apk add --no-cache make

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["build"]