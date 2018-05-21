require 'rails_helper'

RSpec.describe "breweries/edit", type: :view do
  before(:each) do
    @brewery = assign(:brewery, Brewery.create!(
      :name => "MyString",
      :location => "MyString"
    ))
  end

  it "renders the edit brewery form" do
    render

    assert_select "form[action=?][method=?]", brewery_path(@brewery), "post" do

      assert_select "input[name=?]", "brewery[name]"

      assert_select "input[name=?]", "brewery[location]"
    end
  end
end
