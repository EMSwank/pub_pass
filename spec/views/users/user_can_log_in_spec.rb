require 'rails_helper'

describe "Vistor" do
  context "signs up to be a user." do
    it "Completes the sign-up process" do
    visit '/'

    click_on 'Sign Up!'

    expect(current_path).to eq(new_user_path)
    
    fill_in "user[username]",	with: "Guzzler"
    fill_in "user[password]",	with: "password"

    click_on 'Create User'

    expect(page).to have_content("Welcome, Guzzler!") 
    end
  end
  

  context "logs in." do
    xit "should log in the user" do
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
