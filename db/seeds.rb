# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

stacy = User.create(email:'stacy@example.com',password:'grapefruit',nickname:'Stacy')
dan = User.create(email:'dan@example.com',password:'rambutan',nickname:'Dan')
jess = User.create(email:'jeshbrand@gmail.com',password:'banana',nickname:'Jess', is_coach:true)
raj = User.create(email:'raj@example.com', password:'avocado',nickname:'Raj',is_coach:true)

#empty slots
raj_mon = Slot.create(start: '2021-09-13 10:00:00', end: '2021-09-13 10:30:00', coach_id: '4')
raj_tue = Slot.create(start: '2021-09-14 10:00:00', end: '2021-09-14 10:30:00', coach_id: '4')
raj_wed = Slot.create(start: '2021-09-15 09:00:00', end: '2021-09-15 09:30:00', coach_id: '4')
raj_thur = Slot.create(start: '2021-09-16 09:00:00', end: '2021-09-16 09:30:00', coach_id: '4')

jess_mon = Slot.create(start: '2021-09-13 11:00:00', end: '2021-09-13 11:30:00', coach_id: '3')
jess_tue = Slot.create(start: '2021-09-14 11:00:00', end: '2021-09-14 11:30:00', coach_id: '3')
jess_wed = Slot.create(start: '2021-09-15 09:00:00', end: '2021-09-15 09:30:00', coach_id: '3')
jess_thur = Slot.create(start: '2021-09-16 09:00:00', end: '2021-09-16 09:30:00', coach_id: '3')

#booked slots
#(MAKE SOME)
stacy_jess_mon = Slot.create(start: '2021-09-13 09:00:00', end: '2021-09-13 09:30:00', coach_id: '3', is_booked: '1', student_id: '1')
stacy_raj_mon = Slot.create(start: '2021-09-13 09:00:00', end: '2021-09-13 09:30:00', coach_id: '4', is_booked: '1', student_id: '1')
dan_jess_tue = Slot.create(start: '2021-09-14 10:00:00', end: '2021-09-14 10:30:00', coach_id: '3', is_booked: '1', student_id: '2')
dan_raj_tue = Slot.create(start: '2021-09-14 11:00:00', end: '2021-09-14 11:30:00', coach_id: '4', is_booked: '1', student_id: '2')

stacy_jess_wed = Slot.create(start: '2021-09-15 11:00:00', end: '2021-09-15 11:30:00', coach_id: '3', is_booked: '1', student_id: '1')
stacy_raj_wed = Slot.create(start: '2021-09-15 12:00:00', end: '2021-09-15 12:30:00', coach_id: '4', is_booked: '1', student_id: '1')
dan_jess_thur = Slot.create(start: '2021-09-16 11:00:00', end: '2021-09-16 11:30:00', coach_id: '3', is_booked: '1', student_id: '2')
dan_raj_thur = Slot.create(start: '2021-09-16 11:00:00', end: '2021-09-16 11:30:00', coach_id: '4', is_booked: '1', student_id: '2')



# get something called database cleaner gem 

# check out our seeds
# user  rails console to check stuff
# ffaker is a gem to create dummy data: great for generating stuff at scale. 
# e.g. creating 100 coaches