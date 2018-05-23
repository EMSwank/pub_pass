require 'rails_helper'

RSpec.describe "beers/index", type: :view do
  before(:each) do
    brewery = Brewery.create(name: "Coors", location: "Golden")
    assign(:beers, [
      Beer.create!(
        :name => "Name",
        :style => "Style",
        :brewery => brewery
      ),
      Beer.create!(
        :name => "Name",
        :style => "Style",
        :brewery => brewery
      )
    ])
  end

  it "renders a list of beers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Style".to_s, :count => 2
  end
end
