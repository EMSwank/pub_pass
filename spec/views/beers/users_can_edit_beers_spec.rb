require 'rails_helper'

describe "The user can edit a beer" do
  context "when they fill out a form and click edit." do
    it "The beer actually gets changed." do
      admin = User.create(username: "Optimus Prime", password: "Steak", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      beer = Beer.create(name: "Velvet Merkin", style: "Barrel-Aged Imperial Stout")

      new_beer_name = "Velvet Merkin 2016"
      new_beer_style = "Tequila Barrel-Aged Imperial Oatmeal Stout"

      visit edit_admin_beer_path(beer)

      fill_in "beer[name]",	with: new_beer_name
      fill_in "beer[style]",	with: new_beer_style

      click_on "Update"

      expect(current_path).to eq(beer_path(beer))
      expect(page).to have_content(new_beer_name)
      expect(page).to have_content(new_beer_style)
    end
  end
end
