# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:



## System dependencies


- [Ruby](https://www.ruby-lang.org/en/): we recommend using
  [rbenv](https://github.com/rbenv/rbenv) to install the Ruby version  2.6.5p114 or higher.
- [Rails](https://rubygems.org/gems/rails): we recommend using 6.0.0 ot higher
- [Yarn](https://yarnpkg.com/) 1.x: please refer to their
  [installation guide](https://classic.yarnpkg.com/en/docs/install).  > 1.21.1 or higher.
- [PostgreSQL](https://www.postgresql.org/) 9.4 or higher.



# Configuration

* Run 
* bundle install
* yarn install
* set username and password in database.yml

# Database creation
* rake db:create 
* rake db:migrate
* rake db:seed

-Seed User 
* Email: 'test@publishevents.com'
* Password: '123456'


# How to run the test suite
* RAILS_ENV=test rake db:create
* RAILS_ENV=test rake db:migrate 
* RAILS_ENV=test rake db:seed
* Run: rspec spec

