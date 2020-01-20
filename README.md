# README

#Wellness Application

This is Wellness application is built on Ruby on Rails. It utilizes ActiveRecord associations, RESTful routes, includes a Class level ActiveRecord scope model, and nested routes. It is designed to be a digital wellness journal for a user to track their wellness journey. Users can browse areas of focus of other users of the application, they can create new areasof focus (topics), create entries associated with topics, and searchable keywords connected to entries. 

To get started:

Fork and clone the repository to your machine. Cd into the directory and do the following:

bundle install to make use of all the gems and dependencies

rails db:migrate

Start your server(which will run on localhost 3000)

rails s 

Navigate to the browser and type in:
http://localhost:3000

#Omniauth-Github 
Set up a .env file in the root directory. 
Include:

GITHUB_KEY=YOUR_KEY 
GITHUB_SECRET=YOUR_SECRET_KEY

add .env to your .gitignore file to keep your Key and Secret protected

#License:

This project is available as open source under the terms of the MIT License.

