# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. The purpose of this project was to simulate a real-world scenario by implementing bug fixes and new features to an existing codebase in an unfamiliar language. New features were tested using RSpec and Cypress.

### Home Page

![](https://user-images.githubusercontent.com/101907461/172763983-b6d7414e-6853-406a-bb48-fa92d308bf46.png)

### Products Page

![](https://user-images.githubusercontent.com/101907461/172764191-90ab5814-bf95-48b7-9d0d-ca2a361c15e3.png)

### Register Page

![](https://user-images.githubusercontent.com/101907461/172764305-9e466964-8af4-4db5-ac44-0ab13b9ba6a5.png)

### Login Page

![](https://user-images.githubusercontent.com/101907461/172764406-ec7e6afc-73c7-49a0-b0e6-d6ab6a7005db.png)

## Tech Stack

* Ruby on Rails
* Active Record
* CSS (Bootstrap)
* RSpec
* Cypress

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

