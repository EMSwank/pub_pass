require 'rails'

describe "User visits categories index page" do
  context "as an admin" do
    it "allows admin to see all categories" do
      admin = User.create(username: "Optimus Prime", password: "Steak", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      expect(page).to have_content("Admin Categories")
    end
  end
end
