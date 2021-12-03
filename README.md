# Project

RemoteDojo Coding Challenge

## Install

### Clone the repository

```shell
git clone git@github.com:markpuerto/remotedojo.git
```

### Check your Rails and Ruby version

Project is built on `Rails 6.0.4.1` and running on `Ruby 3.0.2`. Make sure to use `rvm` as the environment for running ruby.

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle install

yarn
```

Project is also using [Webpacker](https://github.com/rails/webpacker)

```shell
bundle exec rails webpacker:install
```

### Set environment variables

Set up local environment which I set up in `config/database.yml` file named `LOCAL_DB_USERNAME`. It's the role username of your database (See below how to install the database)

### Initialize the database

The database used is `PostgreSQL`. Since I am using macOS you can install it through Homebrew by doing `brew install postgresql`. Make sure Homebrew is updated. You can check this [link](https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos) for more information on how to install it.

For windows machine - not sure how to set it up. As long as you have PostgreSQL, the rails command will execute it right away.

```shell
rails db:create

rails db:migrate
```

### Run the Codebase

Once all dependencies are installed and database migrated, you can do `rails s` to run the server and then open a browser and start typing in `localhost:3000` to view the site.
