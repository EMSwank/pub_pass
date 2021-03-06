require 'rails_helper'

RSpec.describe "User visits the brewery show page", type: :view do
  before(:each) do
    @brewery = assign(:brewery, Brewery.create!(
      :name => "Name",
      :location => "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Location/)
  end
end
