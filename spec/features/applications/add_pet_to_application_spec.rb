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

  end

  describe "When I visit an application show page" do
    describe "And I search for a Pet by name" do
      describe "And I see the names of Pets that match the search" do
        it "Renders an 'Adopt this Pet' button" do
          visit '/applications/1'
          fill_in(:pet_name, with: 'Rudy')
          click_button('Submit')

          expect(page).to have_button('Adopt this Pet')
        end

        describe "When I click this button" do
          it "Redirects me to the application show page, were the pet's name is listed under the pets section on the application" do
            visit '/applications/1'
            fill_in(:pet_name, with: 'Rudy')
            click_button('Submit')
            click_button('Adopt this Pet')
            expect(page).to have_link('Rudy')
          end
        end
      end
    end
  end
end
