# README

### How to demo:

1) copy this repo
2) ```bundle install```
3) ```rails db:drop && rails db:create && rails db:migrate && rails s```
4) open localhost:3000 and register to start using it. 

### Purpose:

Create a basic scheduling app which allows for students and coaches to meet up in specific time slots. 

### Basic functions:

* Log in as a coach or a student
* Create a time slot in which you are free, as a coach
* Book a slot with a coach, as a student
* See your upcoming meetings (and, as a coach, your free slots)
* Cancel meetup (and, as a coach, have the option to delete the slot)
* Prevent time clashes/double booking for both parties. 

### Stretch goals: 

* Extend the viewable calendar function to the coachee user journey

### Bug fixes/improvements

* Redirection after coach interacts with the booking calendar function should be tidier
* The calendar should also show who booked a session with the coach
* Prune the unneeded pages. 

#### Other details I should probably have in this file:

* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...
