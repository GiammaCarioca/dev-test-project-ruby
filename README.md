# Dev Test Project - Ruby

## Project description

You've received a text file (tab separated) with data describing the company sales. We need a way for this data to be imported to a database to be analyzed later.

Your job is to create a web interface that accepts file uploads, normalizes the data and stores it in a relational database.

## Specifications

* Ruby version: 3.0.2

* Rails version: 6.1.4.4

## Setup

1. Install all the gems Rails will need:

        $ bundle install

2. Initialize database:

        $ rails db:migrate

3. Start the web server:

        $ rails server

4. Go to `http://localhost:3000`.

## Testing

        $ rails test

        $ open coverage/index.html

## Requirements

* [x]  Accept (via HTML form) file uploads of TAB-separated files with the following columns
* [x]  Interpret (parse) the received file and normalize the data.
* [x]  Save the data correctly in a relational database.
* [x]  Don't forget to model the entities imported from the file data, considering their relationships.
* [x]  Show the total gross income represented by the sales data after each file upload.
* [x]  Show the total all-time gross income.
* [x]  Be written in Ruby 2.5 or greater.
* [x]  Have good automated tests coverage.
* [x]  Be simple to configure and execute, running on a Unix-compatible environment (Linux or macOS).
* [x]  Use only free / open-source language and libraries.

## Credits

https://codepen.io/vineethtrv/pen/vNNXmy
