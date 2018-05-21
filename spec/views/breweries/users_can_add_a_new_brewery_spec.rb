require 'rails_helper'

RSpec.describe "breweries/new", type: :view do
  before(:each) do
    assign(:brewery, Brewery.new(
      :name => "MyString",
      :location => "MyString"
    ))
  end

  it "renders new brewery form" do
    render

    assert_select "form[action=?][method=?]", breweries_path, "post" do

      assert_select "input[name=?]", "brewery[name]"

      assert_select "input[name=?]", "brewery[location]"
    end
  end
end
