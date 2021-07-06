# Project:  Relational Rails

### Group Member Names:  Antonio King, Taylor Varoglu, Alex Klick

* Ruby version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System dependencies](https://github.com/tvaroglu/relational_rails/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database creation
    ```bash
    $ rails db:create
    Created database 'relational_rails_development'
    Created database 'relational_rails_test'
    ```

* Database initialization
    ```bash
    $ rails generate migration Create<Model> <key:value key:value>
    $ rails db:migrate
    $ rails dbconsole
    ```

* How to run the test suite
    ```bash
    $ bundle exec rspec
    ```

* Configuration

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
    ```bash
    $ rails s
    ```
    [http://localhost:3000](http://localhost:3000)
