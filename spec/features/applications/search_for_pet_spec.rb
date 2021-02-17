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
                                      application_status: "In Progress",
                                      id: 1)

  end

  describe "When I visit an application show page" do
    it "Renders an 'Add a Pet to this Application' section" do
      visit '/applications/1'
      expect(page).to have_content('Add a Pet to this Application')
    end

    it "Renders a 'Pet name' search bar with a submit button" do
      visit '/applications/1'
      expect(page).to have_content('Pet name:')
      expect(page).to have_button('Submit')
    end

    describe "When I input a pet name and hit the submit button" do
      it "Renders the pet information for the seached pet" do
        visit '/applications/1'
        fill_in(:pet_name, with: 'Rudy')
        click_button('Submit')
        expect(page).to have_content('Rudy')
        expect(page).to have_content('Sex: male')
        expect(page).to have_content('Approx Age: 1')
        expect(page).to have_content('Description: Full of energy')
      end
    end
  end
end
