require 'rails_helper'

describe "A user visits the page to create a brewery", type: :view do

  it "and sees a form." do
    visit new_brewery_path

    expect(page).to have_content("Name")
  end

  it "and it creates it." do
    visit new_brewery_path

    fill_in 'brewery[name]', with: "Comrade Brewing Company"
    fill_in 'brewery[location]', with: "Denver, CO"
    click_on "Create Brewery"

    expect(page).to have_content("Comrade Brewing Company")
    expect(current_path).to eq(breweries_path)
  end
end