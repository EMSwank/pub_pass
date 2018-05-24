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

      expect(page).to have_content(user.title)
      expect(page).to have_content(user.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end