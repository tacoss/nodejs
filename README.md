## How it works?

This image is designed to work with NodeJS and Testcafé, in order to run E2E tests from the sources you MUST have a directory `src` in your project's root.

If that's not the case, just change the `src` dependency from all Makefile targets.

Once steps below are done you'll be able to run `make ci` locally.

### Initial steps:

1. Add a minimal `Makefile` with this contents into your repo

```mf
# default browser for tests
browser ?= chrome

# type `make` without arguments to list available tasks
help: Makefile
  @awk -F':.*?##' '/^[a-z0-9\\%!:-]+:.*##/{gsub("%","*",$$1);gsub("\\\\",":*",$$1);printf "\033[36m%8s\033[0m %s\n",$$1,$$2}' $<

ci: src deps ## Run CI scripts
  @npm run test -- --color

dev: src deps ## Start dev tasks
  @npm run dev & npm run serve

e2e: src deps ## Run E2E tests locally
  @BROWSER=$(browser) npm run test

# this target will ensure node_modules is up-to-date
deps: package*.json
  @(((ls node_modules | grep .) > /dev/null 2>&1) || npm i) || true
```

2. Configure some scripts and dependencies in your `package.json`

```json
{
  "scripts": {
    "dev": "echo '[RUN DEV SCRIPTS]'",
    "serve": "sirv start [PUBLIC_FOLDER] --dev --quiet --single --port [CUSTOM_PORT]",
    "test": "npm run test:e2e -- ${BROWSER:-chrome:headless} -a 'npm run serve' [E2E_CASES]",
    "test:e2e": "BASE_URL=http://localhost:[CUSTOM_PORT] testcafe"
  },
  "devDependencies": {
    "sirv-cli": "^0.4.4",
    "testcafe": "^1.5.0"
  }
}
```

Here is important to change all `[PLACE_HOLDERS]` into valid values to match your repository layout and settings.

For the `dev` script please replace the entire command to match your setup.

The value for `[E2E_CASES]` must point to a folder containing tests, e.g. `e2e/cases`

3. Add a github's workflow file as `./github/workflows/testing.yml`

```yml
name: build
on: [push]
jobs:
  build-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: tacoss/nodejs@master
        env:
          BROWSER: chromium:headless
        with:
          args: ci
```

This workflow will work as-is, no further changes are needed.
