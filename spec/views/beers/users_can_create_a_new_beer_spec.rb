require 'rails_helper'

describe "A user visits the page to create a beer", type: :view do

  it "and sees a form." do
    visit new_beer_path

    expect(page).to have_content("Name")
  end

  it "and it creates it." do
    visit new_beer_path

    fill_in 'beer[name]', with: "Super 77"
    fill_in 'beer[style]', with: "Wheat Ale"
    click_on "Create Beer"

    expect(page).to have_content("Super 77")
    expect(current_path).to eq(beers_path)
  end
  
end
