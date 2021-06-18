# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

User.destroy_all 
Parking.destroy_all

user1 = User.create!(first_name: "Jean", last_name: "Labas", password: "azerty", email: "jean@email.com", phone_number: "06.06.06.06.06")
user2 = User.create!(first_name: "Chris", last_name: "Ici", password: "azerty", email: "Chris@email.com", phone_number: "07.07.07.07.07")
user3 = User.create!(first_name: "Youssef", last_name: "MVP", password: "azerty", email: "YMVP@email.com", phone_number: "08.08.08.08.08")


photo_parking1 = URI.open("https://images.unsplash.com/photo-1590674899484-d5640e854abe?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=747&q=80")
photo_parking2 = URI.open("https://images.unsplash.com/photo-1617221276100-f2b36c4c0d44?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1900&q=80")
photo_parking3 = URI.open("https://images.unsplash.com/photo-1580137331426-c28eb6be023b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1934&q=80")
photo_parking4 = URI.open("https://images.unsplash.com/photo-1565800847110-43e51cb90fde?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80")

parking1 = Parking.new(title:"Garage au coeur de Lille" ,address: "34 Rue des Bouchers, Lille, Hauts-de-France, France", description: "Garage situé en sous-sol",start_date: Date.new(2021,06,23), end_date: Date.new(2021,06,25), from_hour: Time.now, to_hour: Time.now, available: true)
parking2 = Parking.new(title:"place extérieur" ,address: "15 Rue du Congo, Mouvaux, Hauts-de-France, France", description: "Garage extérieur avec porte automatique", start_date: Date.new(2021,07,02), end_date: Date.new(2021,07,05), from_hour: Time.now, to_hour: Time.now, available: true)
parking3 = Parking.new(title:"Box pour 2 roues" ,address: "56 Rue de la Barre, Lille, Hauts-de-France, France", description: "Box pour 2 motos", start_date: Date.new(2021,01,01), end_date: Date.new(2021,01,20), from_hour: Time.now, to_hour: Time.now, available: true)
parking4 = Parking.new(title:"Local pour 5 vélos" ,address: "465 Littoral Frédéric Mistral, Toulon, Provence-Alpes-Côte d'Azur, France", description: "Local à vélos", start_date: Date.new(2021,03,16), end_date: Date.new(2021,03,17), from_hour: Time.now, to_hour: Time.now, available: true)

parking1.photo.attach(io: photo_parking1, filename: "photo1", content_type: "image/jpg")
parking2.photo.attach(io: photo_parking2, filename: "photo2", content_type: "image/jpg")
parking3.photo.attach(io: photo_parking3, filename: "photo3", content_type: "image/jpg")
parking4.photo.attach(io: photo_parking4, filename: "photo4", content_type: "image/jpg")


parking1.user = user1
parking2.user = user1
parking3.user = user3
parking4.user = user2

parking1.save!
parking2.save!
parking3.save!
parking4.save!