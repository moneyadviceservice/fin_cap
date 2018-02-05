# FinCap - Financial Capability

All the things for Money Advice Service's Financial Capability website.

## Prerequisites

* [Git](http://git-scm.com)
* [Rbenv](https://github.com/rbenv/rbenv)
* [Ruby][Ruby] - see version specified in [Gemfile](Gemfile)

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