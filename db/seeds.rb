# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter1 = Shelter.create(name: "Denver Humane Society",
                          address: "123 Main Street",
                          city: "Denver",
                          state: "CO",
                          zip: 12588)

application1 = Application.create(name: "Tommy",
                                  address: "2860 W32 Ave",
                                  city: "Denver",
                                  state: "CO",
                                  zip: 80211,
                                  description: "I like dogs",
                                  application_status: "Pending")

pet1 = Pet.create(image: "rudy.jpg",
                  name: "Rudy",
                  approximate_age: 1,
                  shelter_id: 1,
                  description: "Full of energy",
                  adoptable: false,
                  sex: 1)

PetApplication.create!(pet: pet1, application: application1)
