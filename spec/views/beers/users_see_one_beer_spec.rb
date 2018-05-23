require 'rails_helper'

RSpec.describe "beers/show", type: :view do
  before(:each) do
    brewery = Brewery.create(name: "Coors", location: "Golden")
    @beer = assign(:beer, Beer.create!(
      :name => "Name",
      :style => "Style",
      :brewery => brewery
    ))
  end
  
  it "renders attributes" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Style/)
  end
end
