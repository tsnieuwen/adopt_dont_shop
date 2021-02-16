require 'rails_helper'

RSpec.describe "As a visitor" do
  # before :each do
#
    # @shelter1 = Shelter.create(name: "Denver Humane Society",
    #                           address: "123 Main Street",
    #                           city: "Denver",
    #                           state: "CO",
    #                           id: 1,
    #                           zip: 12588)
    #
    # @pet1 = Pet.create(image: "rudy.jpg",
    #                   name: "Rudy",
    #                   approximate_age: 1,
    #                   shelter_id: 1,
    #                   description: "Full of energy",
    #                   adoptable: false,
    #                   sex: 1,
    #                   id: 1)
    #
    # @application1 = Application.create(name: "Tommy",
    #                                   address: "2860 W32 Ave",
    #                                   city: "Denver",
    #                                   state: "CO",
    #                                   zip: 80211,
    #                                   description: "I like dogs",
    #                                   application_status: "Pending",
    #                                   id: 1)

    # PetApplication.create!(pet: @pet1, application: @application1)
  # end

  describe "When I visit the new application page" do
    describe "And I fail to fill in any of the form fields" do
      describe "And I click 'Submit'" do
        it "I cannot create an application without applicant's name" do
          visit '/applications/new'
          click_button('Submit')
          expect(page).to have_current_path('/applications/new')
          expect(page).to have_content("Application not created: Required information missing.")

          # expect(page).to have_content("Please enter your name")
          # expect(page).to have_content("Please enter your address")
          # expect(page).to have_content("Please enter your city")
          # expect(page).to have_content("Please enter your state")
          # expect(page).to have_content("Please enter your zipcode")
          # expect(page).to have_content("Please enter why you will be a good home")
        end
      end
    end
  end
end
