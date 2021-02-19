require 'rails_helper'

describe Pet, type: :model do

  describe 'relationships' do
    it {should belong_to :shelter}
    it {should have_many :pet_applications}
    it {should have_many(:applications).through(:pet_applications)}
  end

  describe 'class_methods' do
    describe '#find_by_name' do
      it "finds correct pet record by name" do
        shelter1 = Shelter.create(name: "Denver Humane Society",
                                  address: "123 Main Street",
                                  city: "Denver",
                                  state: "CO",
                                  zip: 12588,
                                  id: 1)

        pet1 = Pet.create(image: "rudy.jpg",
                          name: "Rudy",
                          approximate_age: 1,
                          shelter_id: 1,
                          description: "Full of energy",
                          adoptable: true,
                          sex: 1)

        # pet2 = Pet.create(image: "clifford.jpg",
        #                   name: "Clifford",
        #                   approximate_age: 30,
        #                   shelter_id: 1,
        #                   description: "Big and red",
        #                   adoptable: true,
        #                   sex: 1)
        #
        # pet3 = Pet.create(image: "scooby.jpg",
        #                   name: "Scooby",
        #                   approximate_age: 35,
        #                   shelter_id: 1,
        #                   description: "Rut Row",
        #                   adoptable: true,
        #                   sex: 1)
        #
        # pet4 = Pet.create(image: "lassie.jpg",
        #                   name: "Lassie",
        #                   approximate_age: 50,
        #                   shelter_id: 1,
        #                   description: "Hero",
        #                   adoptable: true,
        #                   sex: 0)
        expect(Pet.find_by_name('Rudy')).to eq([pet1])
      end

      it "returns names that are a partial match" do
        shelter1 = Shelter.create(name: "Denver Humane Society",
                                  address: "123 Main Street",
                                  city: "Denver",
                                  state: "CO",
                                  zip: 12588,
                                  id: 1)

        pet1 = Pet.create(image: "rudy.jpg",
                          name: "Rudy",
                          approximate_age: 1,
                          shelter_id: 1,
                          description: "Full of energy",
                          adoptable: true,
                          sex: 1)
        expect(Pet.find_by_name('ud')).to eq([pet1])
      end

      it "returns names that are a case insensitive match" do
        shelter1 = Shelter.create(name: "Denver Humane Society",
                                  address: "123 Main Street",
                                  city: "Denver",
                                  state: "CO",
                                  zip: 12588,
                                  id: 1)

        pet1 = Pet.create(image: "rudy.jpg",
                          name: "Rudy",
                          approximate_age: 1,
                          shelter_id: 1,
                          description: "Full of energy",
                          adoptable: true,
                          sex: 1)
        expect(Pet.find_by_name('Ud')).to eq([pet1])
      end
    end
  end
  # describe 'validations' do
  #   it {should validate_presence_of :name}
  #   it {should validate_presence_of :description}
  #   it {should validate_presence_of :sex}
  #   it {should validate_numericality_of(:approximate_age).is_greater_than_or_equal_to(0)}

    # it 'is created as adoptable by default' do
    #   shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
    #   pet = shelter.pets.create!(name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
    #   expect(pet.adoptable).to eq(true)
    # end

    # it 'can be created as not adoptable' do
    #   shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
    #   pet = shelter.pets.create!(adoptable: false, name: "Fluffy", approximate_age: 3, sex: 'male', description: 'super cute')
    #   expect(pet.adoptable).to eq(false)
    # end

    # it 'can be male' do
    #   shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
    #   pet = shelter.pets.create!(sex: :male, name: "Fluffy", approximate_age: 3, description: 'super cute')
    #   expect(pet.sex).to eq('male')
    #   expect(pet.male?).to be(true)
    #   expect(pet.female?).to be(false)
    # end

    # it 'can be female' do
    #   shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
    #   pet = shelter.pets.create!(sex: :female, name: "Fluffy", approximate_age: 3, description: 'super cute')
    #   expect(pet.sex).to eq('female')
    #   expect(pet.female?).to be(true)
    #   expect(pet.male?).to be(false)
    # end
  # end
end
