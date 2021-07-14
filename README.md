# Project:  Relational Rails

### Group Member Names:
* Taylor Varoglu (Regions & Resorts)
* Antonio King (Parks & Trails)
* Alex Klick (Ski Brands & Skis)

#### Database Schemas:
<img width="500" alt="schema_regions_resorts" src="https://user-images.githubusercontent.com/58891447/125694413-49b5a13a-0ed9-4de1-9d9a-1c0881cc9ea9.png">
<img width="500" alt="schema_parks_trails" src="https://user-images.githubusercontent.com/58891447/125694264-b0b9e9c7-44a2-45d8-9a36-c6020004275b.png">
<img width="500" alt="schema_ski_brands_skis" src="https://user-images.githubusercontent.com/58891447/125693822-1b169ddb-9fd4-4195-a4ad-b52e2d6f12cd.png">



#### Project Configuration

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

* Deployment instructions
    ```bash
    $ rails s
    ```
    [http://localhost:3000](http://localhost:3000)
