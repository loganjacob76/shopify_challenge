# Shopify Challenge

## Background and Description

Shopify Challenge is built for a logistics company that deals in beers.
You will automatically be taken to a list of active beers and their number of cases that are currently in inventory.
Click on a link to see the same type of index, but with deleted beers or click on a specific beer to see it's information.
The active beer list also has a button to add new beers.
The beer show pages will have the beer's name, inventory, and deletion comment if available, also a button to edit.
The edit page will allow you to edit the beer or write a deletion comment and delete it.
If the beer has already been deleted the edit page will instead have a button to undelete which sets the deletion comment as the date it was undeleted.

## Technology and Implementation

Shopify Challenge was built using the following technologies:
* Ruby on Rails
* Ruby
* PostgreSQL

## Setup

This project runs on Ruby 2.5.3 and Rails 5.2.8.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:{create,migrate,seed}`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.