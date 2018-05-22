require 'rails_helper'

describe "Vistor" do
  context "signs up to be a user." do
    it "Completes the sign-up process" do
    visit '/'

    click_on 'Sign Up!'

    expect(current_path).to eq(users_new_path)
    
    fill_in "user[username]",	with: "Guzzler"
    fill_in "user[password]",	with: "password"

    click_on 'Create User'

    expect(page).to have_content("Welcome, Guzzler!") 
    end
  end
  

  context "logs in." do
    it "should log in the user" do
      username = 'Humphrey'
      password = 'Bogart'

      user = User.create(username: username, password: password)
      
      visit '/'

      click_on "Log in"

      expect(current_path).to eq(login_path)

      fill_in :username,	with: username
      fill_in :password,	with: password
      click_on "Let me in"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_link("Log Out")
    
    end

    it "should be able to log out." do
      username = 'Humphrey'
      password = 'Bogart'

      user = User.create(username: username, password: password)

      visit '/'

      click_on "Log in"

      expect(current_path).to eq(login_path)

      fill_in :username,	with: username
      fill_in :password,	with: password
      click_on "Let me in"

      click_on "Log Out"

      expect(current_path).to eq(root_path)
      expect(page).to_not have_content("Log Out")
      expect(page).to have_content("Log in")
    end
  end
end
