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
      it "Renders 'Approve Pet' and 'Reject Pet' buttons" do
        visit '/applications/1'
        fill_in(:pet_name, with: 'Rudy')
        click_button('Submit')
        click_button('Adopt this Pet')
        fill_in(:description, with: 'I really want this dog')
        click_button('Submit Application')
        visit '/admin/applications/1'

        expect(page).to have_button('Approve Pet')
        expect(page).to have_button('Reject Pet')
      end
    end

      describe "When I click 'Approve Pet'" do
        it "it updates the page to reflect the status of the pet on the application, and the 'Approve Pet' button is no longer rendered" do
          visit '/applications/1'
          fill_in(:pet_name, with: 'Rudy')
          click_button('Submit')
          click_button('Adopt this Pet')
          fill_in(:description, with: 'I really want this dog')
          click_button('Submit Application')
          visit '/admin/applications/1'
          click_button('Approve Pet')

          expect(page).to have_content('Status: approved')
          expect(page).to_not have_button('Approve Pet')
          expect(page).to have_button('Reject Pet')
        end
      end

      describe "When I click 'Reject Pet'" do
        it "it updates the page to reflect the status of the pet on the application, and the 'Reject Pet' button is no longer rendered" do
          visit '/applications/1'
          fill_in(:pet_name, with: 'Rudy')
          click_button('Submit')
          click_button('Adopt this Pet')
          fill_in(:description, with: 'I really want this dog')
          click_button('Submit Application')
          visit '/admin/applications/1'
          click_button('Reject Pet')

          expect(page).to have_content('Status: rejected')
          expect(page).to have_button('Approve Pet')
          expect(page).to_not have_button('Reject Pet')
        end
      end
  end
end
