require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    @application1 = Application.create(name: "Tommy",
                                      address: "2860 W32 Ave",
                                      city: "Denver",
                                      state: "CO",
                                      zip: 80211,
                                      description: "I like dogs",
                                      pet_names: "Fido, Rudy, Spot",
                                      application_status: "Pending",
                                      id: 1)
  end
  describe "When I visit an applications show page" do
    it "Renders the applicant's name" do
      visit '/applications/1'
      expect(page).to have_content(@application1.name)
    end

    it "Renders the applicant's full address" do
      visit '/applications/1'
      expect(page).to have_content(@application1.address)
      expect(page).to have_content(@application1.city)
      expect(page).to have_content(@application1.state)
      expect(page).to have_content(@application1.zip)
    end

    it "Renders a description of why applicant wants to adopt" do
      visit '/applications/1'
      expect(page).to have_content(@application1.description)
    end

    it "Renders names of pets that the applicant want to adopt" do
      visit '/applications/1'
      expect(page).to have_content(@application1.pet_names)
    end

    it "Renders the application status" do
      visit '/applications/1'
      expect(page).to have_content(@application1.application_status)
    end
    
  end


end
