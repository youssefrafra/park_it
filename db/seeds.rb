# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

file = URI.open('https://unsplash.com/photos/DvTUnx7OOuo')
parkingspot1 = Parking.new(title:"Un titre" ,address: "2 rue de Lille", description: "Pour grosse voiture",start_date: Date.new(2021,06,23), end_date: Date.new(2021,06,25), from_hour: Time.now, to_hour: Time.now, available: true)
parkingspot1.photo.attach(io: file, filename: 'parkingspot1.png', content_type: 'image/png')

file = URI.open('https://unsplash.com/photos/TrvLsDu4sHk')
parkingspot2 = Parking.new(title:"Un titre" ,address: "3 rue de Lille", description: "Pour grosse voiture",start_date: Date.new(2021,06,23), end_date: Date.new(2021,06,25), from_hour: Time.now, to_hour: Time.now, available: true)
parkingspot2.photo.attach(io: file, filename: 'parkingspot2.png', content_type: 'image/png')

file = URI.open('https://unsplash.com/photos/jeQz9ULm8iE')
parkingspot3 = Parking.new(title:"Un titre" ,address: "4 rue de Lille", description: "Pour grosse voiture",start_date: Date.new(2021,06,23), end_date: Date.new(2021,06,25), from_hour: Time.now, to_hour: Time.now, available: true)
parkingspot3.photo.attach(io: file, filename: 'parkingspot3.png', content_type: 'image/png')


User.destroy_all if Rails.env.development?
Parking.destroy_all if Rails.env.development?

user1 = User.create!(first_name: "Jean", last_name: "Labas", password: "azerty", email: "jean@email.com", phone_number: "06.06.06.06.06")
user2 = User.create!(first_name: "Chris", last_name: "Ici", password: "azerty", email: "Chris@email.com", phone_number: "07.07.07.07.07")
user3 = User.create!(first_name: "Youssef", last_name: "MVP", password: "azerty", email: "YMVP@email.com", phone_number: "08.08.08.08.08")

parking1 = Parking.new(title:"Un titre" ,address: "34 rue des bouchers, Lille", description: "Pour grosse voiture",start_date: Date.new(2021,06,23), end_date: Date.new(2021,06,25), from_hour: Time.now, to_hour: Time.now, available: true)
parking2 = Parking.new(title:"Un titre" ,address: "15 rue du congo, mouvaux", description: "Pour petite voiture", start_date: Date.new(2021,07,02), end_date: Date.new(2021,07,05), from_hour: Time.now, to_hour: Time.now, available: true)
parking3 = Parking.new(title:"Un titre" ,address: "56 rue de la barre, lille", description: "Pour voiture rouge", start_date: Date.new(2021,01,01), end_date: Date.new(2021,01,20), from_hour: Time.now, to_hour: Time.now, available: true)
parking4 = Parking.new(title:"Un titre" ,address: "465 Littoral Frédéric Mistral, Toulon", description: "Pour 4 motos", start_date: Date.new(2021,03,16), end_date: Date.new(2021,03,17), from_hour: Time.now, to_hour: Time.now, available: true)

parking1.user = user1
parking2.user = user1
parking3.user = user3
parking4.user = user2

parking1.save!
parking2.save!
parking3.save!
parking4.save!