require 'rails_helper'

RSpec.describe "beers/index", type: :view do
  before(:each) do
    assign(:beers, [
      Beer.create!(
        :name => "Name",
        :style => "Style"
      ),
      Beer.create!(
        :name => "Name",
        :style => "Style"
      )
    ])
  end

  it "renders a list of beers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Style".to_s, :count => 2
  end
end
