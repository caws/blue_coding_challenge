# URL Shortener Challenge

### The challenge

Your mission, should you choose to accept it, is to make a URL shortener API.

### Prerequisites

```
Rails 6.0.0
Ruby 2.6.3
```

### Getting Started

* Clone the project
* rake:db create db:migrate db:seed
* bundle install
* rails s

### Shortening algorithm - The core of this application

The shortening algorithm behind this application is a very basic one in nature.

It works by changing the base of the ID that points to a given record in the database
that holds a given URL.

After a URL is validated and saved to the database, a callback is invoked and it
quickly does the following:

    * 1. Queues a job to visit the URL later at some point and grab its title, while
       also checking if it is Up or Down and updating the records's status accordingly'.
       
    * 2. Invokes the create_short_url method which basically updates the short
       url attribute with the base-changed ID of the record being handled.  

PS: If a user tries to shorten a URL that was already shortened, the application
    behaves the same way it would if said URL was never shortened, however all it
    does is offer the short_url already in the database for the full URL provided.

### Built With
   * [Factory_bot](https://github.com/thoughtbot/factory_bot)
   * [Faker](https://github.com/stympy/faker)
   * [Postgres](https://bitbucket.org/ged/ruby-pg/wiki/Home)
   * [Rails](https://github.com/rails/rails)
   * [Rspec-rails](https://github.com/rspec/rspec)
   * [Shoulda-callback-matchers](https://github.com/jdliss/shoulda-callback-matchers)
   * [Shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers/)
   
    
