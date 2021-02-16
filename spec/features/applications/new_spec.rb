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
      fill_in(:name, with: 'Mike')
      fill_in(:address, with: '459 Broadway')
      fill_in(:city, with: 'Seattle')
      fill_in(:state, with: 'WA')
      fill_in(:zip, with: '23569')
      fill_in(:description, with: 'I want a dog')
      click_button('Submit')
      expect(page).to have_content("Mike")
      expect(page).to have_content("Seattle")
      expect(page).to have_content("WA")
      expect(page).to have_content("23569")
      expect(page).to have_content("I want a dog")
    end
  end

end
