require 'rails_helper'

describe "User visits categories index page" do
  context "as an admin" do
    it "allows admin to see all categories" do
      admin = User.create(username: "Optimus Prime", password: "Steak", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
# binding.pry
      visit admin_categories_path
      expect(page).to have_content("Admin Categories")
    end

    it "and sees a button to create a new beer." do
      admin = User.create(username: "Optimus Prime", password: "Steak", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_beer_path

      expect(page).to have_content("Name")
    end

    it "and it can create it." do
      admin = User.create(username: "Optimus Prime", password: "Steak", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_beer_path

      fill_in 'beer[name]', with: "Super 77"
      fill_in 'beer[style]', with: "Wheat Ale"

      click_on "Create Beer"
      
      expect(page).to have_content("Super 77")
      expect(current_path).to eq(beers_path)
    end

  end

  context "as a default user" do
    it "doesn't allow default user to see admin categories index page" do
      user = User.create(username: "Foo", password: "Baz", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path
      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

  end
end
