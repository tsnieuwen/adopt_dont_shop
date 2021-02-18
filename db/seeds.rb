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
                                  zip: 80211
                                  )
pet1 = Pet.create(image: "rudy.jpg",
                  name: "Rudy",
                  approximate_age: 1,
                  shelter_id: 1,
                  description: "Full of energy",
                  adoptable: true,
                  sex: 1)

pet2 = Pet.create(image: "clifford.jpg",
                  name: "Clifford",
                  approximate_age: 30,
                  shelter_id: 1,
                  description: "Big and red",
                  adoptable: true,
                  sex: 1)

pet3 = Pet.create(image: "scooby.jpg",
                  name: "Scooby",
                  approximate_age: 35,
                  shelter_id: 1,
                  description: "Rut Row",
                  adoptable: true,
                  sex: 1)

pet4 = Pet.create(image: "lassie.jpg",
                  name: "Lassie",
                  approximate_age: 50,
                  shelter_id: 1,
                  description: "Hero",
                  adoptable: true,
                  sex: 0)

# PetApplication.create!(pet: pet1, application: application1)
