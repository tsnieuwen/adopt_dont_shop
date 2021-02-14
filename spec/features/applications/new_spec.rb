require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
#
    @shelter1 = Shelter.create(name: "Denver Humane Society",
                              address: "123 Main Street",
                              city: "Denver",
                              state: "CO",
                              id: 1,
                              zip: 12588)

    @pet1 = Pet.create(image: "rudy.jpg",
                      name: "Rudy",
                      approximate_age: 1,
                      shelter_id: 1,
                      description: "Full of energy",
                      adoptable: false,
                      sex: 1,
                      id: 1)

    @application1 = Application.create(name: "Tommy",
                                      address: "2860 W32 Ave",
                                      city: "Denver",
                                      state: "CO",
                                      zip: 80211,
                                      description: "I like dogs",
                                      application_status: "Pending",
                                      id: 1)

    PetApplication.create!(pet: @pet1, application: @application1)
  end

  describe "As a visitor, when I visit the pet index page" do
    it "Renders a link 'Start an Application'"do
      visit '/pets'
      expect(page).to have_link('Start an Application')
    end
  end

  describe "When I click the 'Start an Application' link" do
    it "Redirects me to the new applications page" do
      visit '/pets'
      click_link('Start an Application')
      expect(page).to have_current_path("/applications/new")
    end
  end

  describe "When on the '/applications/new' page" do
    it "Renders a form where the applicant can input their name, address, city, state, zipcode, why you would make a good owner, and then a submit button" do
      visit '/applications/new'
      expect(page).to have_content('Name:')
      expect(page).to have_content('Street Address:')
      expect(page).to have_content('City:')
      expect(page).to have_content('State:')
      expect(page).to have_content('Zipcode:')
      expect(page).to have_content('Why will you be a good home for this pet(s)?')
      expect(page).to have_button('Submit')
    end
  end

  describe "When I fill out the forms and hit the 'Submit' button " do
    it "Redirects me to the new applications show page, where all the application information is rendered" do
      visit '/applications/new'
      expect(page).to have_content('Name:')
      expect(page).to have_content('Street Address:')
      expect(page).to have_content('City:')
      expect(page).to have_content('State:')
      expect(page).to have_content('Zipcode:')
      expect(page).to have_content('Why will you be a good home for this pet(s)?')
    end
  end

#     it "Renders the applicant's full address" do
#       visit '/applications/1'
#       expect(page).to have_content(@application1.address)
#       expect(page).to have_content(@application1.city)
#       expect(page).to have_content(@application1.state)
#       expect(page).to have_content(@application1.zip)
#     end
#
#     it "Renders a description of why applicant wants to adopt" do
#       visit '/applications/1'
#       expect(page).to have_content(@application1.description)
#     end
#
#     it "Renders names of pets that the applicant want to adopt" do
#       visit '/applications/1'
#       expect(page).to have_content(@pet1.name)
#     end
#
#     it "Renders the application status" do
#       visit '/applications/1'
#       expect(page).to have_content(@application1.application_status)
#     end
#
#     it "Renders the name of the pets as a hyperlink" do
#       visit '/applications/1'
#       expect(page).to have_link(@pet1.name)
#     end
#
#     describe "When I click on a pet name" do
#       it "Takes me to the pet's show page" do
#         visit '/applications/1'
#         click_link("#{@pet1.name}")
#         expect(page).to have_current_path("/pets/#{@pet1.id}")
#       end
#     end
#   end
end
