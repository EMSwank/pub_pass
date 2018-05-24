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
    expect(rendered).to match(brewery)

  end
end

describe "they link from the user index" do
  describe "they fill in a comment form" do
    it "displays the comment on the user show" do
      comment = Comment.create(username: "New Title", body: "New Body")
      beer = Beer.create(name: "Foo", style: "Baztastic")
      
      visit beer_path(beer)

      fill_in "comment[user.name]", with: "ME!"
      fill_in "comment[body]", with: "So many thoughts on this user."
      click_on "Submit"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("ME!")
      expect(page).to have_content("So many thoughts on this user.")
    end
  end
end