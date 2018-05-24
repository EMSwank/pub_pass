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

describe "they link from the user index" do
    it "displays information for one user" do
      user = User.create(username: "Foo", password: "Bar")
      comment_1 = user.comments.create(body: "Commenty comments")
      comment_2 = user.comments.create(body: "So much to say")

      visit users_path

      click_link user.title

      expect(page).to have_content(user.username)
      expect(page).to have_content(user.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end

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