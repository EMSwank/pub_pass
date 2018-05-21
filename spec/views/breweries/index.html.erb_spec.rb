require 'rails_helper'

RSpec.describe "breweries/index", type: :view do
  before(:each) do
    assign(:breweries, [
      Brewery.create!(
        :name => "Name",
        :location => "Location"
      ),
      Brewery.create!(
        :name => "Name",
        :location => "Location"
      )
    ])
  end

  it "renders a list of breweries" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
