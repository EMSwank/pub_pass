require 'rails_helper'

describe "The user can edit a brewery" do
  context "when they fill out a form and click edit." do
    it "The brewery actually gets changed." do
      admin = User.create(username: "Optimus Prime", password: "Steak", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      brewery = Brewery.create(name: "Bell's", location: "Michigan")
      new_brewery_name = "Bell's Brewery"
      new_brewery_location = "Galesburg, MI"

      visit edit_admin_brewery_path(brewery)

      fill_in "brewery[name]",	with: new_brewery_name
      fill_in "brewery[location]",	with: new_brewery_location

      click_on "Update"

      expect(current_path).to eq(brewery_path(brewery))
      expect(page).to have_content(new_brewery_name)
      expect(page).to have_content(new_brewery_location)
    end
  end
end

