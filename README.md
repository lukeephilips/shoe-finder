
# Shoe Finder
==========================

#### _An app to make shoes and then assign them with many-to-many relationships, December 16, 2016_

#### By _**Luke Philips**_

## Description

Allows user to:
* add shoes
* add stores
* add an existing shoe to an existing store
* change all shoes at a store from existing selections
* edit and delete stores
* delete shoes from a particular store retaining all other connections
* delete shoes


## Instructions:

* clone from Github, bundle Gemfile, setup DB (below), launch with sinatra

* db instructions:
 * rake db:create
 * rake db:migrate

## Support and contact details

Check my GitHub:
* _[Luke Philips](https://github.com/lukeephilips)_

## Technologies Used

_Made with Ruby on Sinatra, ActiveRecrod, postgreSQL, unit testing with rspec, integration testing with Capybara._

## User Stories:
*  As a user, I want to be able to add, update, delete and list shoe stores.
*  As a user, I want to be able to add and list new shoe brands.
*  As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands).
*  As a user, I want to be able to add existing shoe brands to a store to show where they are sold.
*  As a user, I want to be able to associate the same brand of shoes with multiple stores.
*  As a user, I want to be able to see all of the brands a store sells on the individual store page.
*  As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
*  As a user, I do not want stores and shoes to be saved if I enter a blank name.

### License

*Created under an MIT license.*

Copyright (c) 2016 **_Luke Philips_**
