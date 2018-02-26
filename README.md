# FinCap - Financial Capability

All the things for Money Advice Service's Financial Capability website.

## Prerequisites

* [Git](http://git-scm.com)
* [Rbenv](https://github.com/rbenv/rbenv)
* [Ruby][Ruby] - see version specified in [.ruby-version](.ruby-version)
* [PostgreSQL](https://www.postgresql.org/)

## Installation

Clone the repository:

```sh
$ git clone https://github.com/moneyadviceservice/fin_cap.git
```

Set up the database
```sh
$ bundle exec rake db:create \
  && bundle exec rake db:schema:load \
  && bundle exec rake db:migrate \
  && bundle exec rake db:seed
```

Make sure to copy the .env-example file:
`cp .env-example .env`

## Usage

This is an engine used by the Frontend site and requires data from the [MAS CMS](https://github.com/moneyadviceservice/cms). Follow the instructions below to start the engine via the Frontend. You may also need to refer to [the Frontend README](https://github.com/moneyadviceservice/frontend/blob/master/README.md) if you have not already set up the Frontend site to run locally.

  1. Start the CMS
  Navigate to your local CMS directory and start the application, e.g.

  ```sh
  $ rails s
  ```

  2. Start the application on a port which is different to the port you started the CMS on, e.g.

  ```sh
  $ foreman start
  ```

  To access the application locally in your browser, navigate to the port on which you started the application, e.g. [http://localhost:5000/en/tools/money-manager/](http://localhost:5000).


[Technical docs](https://github.com/moneyadviceservice/technical-docs/tree/master/fin_cap)

### To Do
Update link for the styleguide when the site is deployed.

[Styleguide](http://localhost:3000/styleguide)

## Hooks

This project uses git hooks to ensure every commit follows best practices.
The test script runs the code lints and the tests.

In order to use the hooks just run this commands:

```sh
  cp hooks/pre-push .git/hooks/pre-push
  chmod u+x .git/hooks/pre-push
```

Note: *It is not recommended but if you want to ignore the hook, you can run*:

```
git push --no-verify origin <your_branch>
```
