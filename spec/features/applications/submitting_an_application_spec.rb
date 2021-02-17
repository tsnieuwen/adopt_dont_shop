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
                                      id: 1)

  end

  describe "When I visit an application show page" do
    describe "And I added one or more pets to the application" do
        it 'Renders a section to submit application' do
          visit '/applications/1'
          fill_in(:pet_name, with: 'Rudy')
          click_button('Submit')
          click_button('Adopt this Pet')

          expect(page).to have_content('Submit Application')
          expect(page).to have_content('Why will you be a good home for this pet(s)?')
          expect(page).to have_button('Submit Application')
        end

        describe "When I fill in why I would be a good home and click 'Submit Application'" do
          it "Updates the application status with my description and changes the application status to 'Pending'" do
            visit '/applications/1'
            fill_in(:pet_name, with: 'Rudy')
            click_button('Submit')
            click_button('Adopt this Pet')
            fill_in(:description, with: 'I really want this dog')
            click_button('Submit Application')

            expect(page).to have_content('Application Status: Pending')
            expect(page).to_not have_content('Add a Pet to this Application')
            expect(page).to_not have_content('Submit Application')

          end
        end
    end
  end
end
