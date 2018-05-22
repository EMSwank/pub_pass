require 'rails_helper'

describe "Vistor" do
  context "logs in." do
    it "should log in the user" do
      username = 'Humphrey'
      password = 'Bogart'

      User.create(username: username, password: password)
      
      visit '/'

      click_on "Log in"

      expect(current_path).to eq(login_path)

    fill_in :username,	with: username
    fill_in :password,	with: password
    click_on "Log in"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_link("Log in")
    end

    
  end
end
