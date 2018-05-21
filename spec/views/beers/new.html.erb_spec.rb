require 'rails_helper'

RSpec.describe "beers/new", type: :view do
  before(:each) do
    assign(:beer, Beer.new(
      :name => "MyString",
      :style => "MyString"
    ))
  end

  it "renders new beer form" do
    render

    assert_select "form[action=?][method=?]", beers_path, "post" do

      assert_select "input[name=?]", "beer[name]"

      assert_select "input[name=?]", "beer[style]"
    end
  end
end
