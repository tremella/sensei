# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

stacy = User.create(email:'stacy@example.com',password:'grapefruit',nickname:'Stacy')
dan = User.create(email:'dan@example.com',password:'rambutan',nickname:'Dan')
jess = User.create(email:'jeshbrand@gmail.com',password:'banana',nickname:'Jess', is_coach:true)
raj = User.create(email:'raj@example.com', password:'avocado',nickname:'Raj',is_coach:true)


# get something called database cleaner gem 
# make more seeds
# check out our seeds
# user  rails console to check stuff
# ffaker is a gem to create dummy data: great for generating stuff at scale. 
# e.g. creating 100 coaches