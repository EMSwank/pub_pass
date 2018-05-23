require 'rails_helper'

describe "An admin visits the page to create a brewery", type: :view do

  it "and sees a form to create a new brewery." do
    admin = User.create(username: "Optimus Prime", password: "Steak", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_brewery_path

    expect(page).to have_content("Name")
  end

  it "and can create it." do
    admin = User.create(username: "Optimus Prime", password: "Steak", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_brewery_path

    fill_in 'brewery[name]', with: "Comrade Brewing Company"
    fill_in 'brewery[location]', with: "Denver, CO"
    click_on "Create Brewery"

    expect(page).to have_content("Comrade Brewing Company")
    expect(current_path).to eq(breweries_path)
  end
end