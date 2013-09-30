require 'spec_helper'

describe "User Authentication" do
  describe "when visiting the sign in page" do
    it "should successfully register a user" do
      
      visit "/users/new"
      expect(current_path).to eq(new_user_path)

      within(:css, '.navbar') do
      	find_link("Sign Up").visible?
      end

      user = FactoryGirl.build(:user)

      fill_in "user[email]", :with => user.email
      fill_in "user[first_name]", :with => user.first_name
      fill_in "user[last_name]", :with => user.last_name
      fill_in "user[username]", :with => user.username
      fill_in "user[password]", :with => user.password
      click_button "Create Account"

      expect(current_path).to eq(root_path)
      page.should have_content("Account created")
      expect(page).to have_content("Account created")
      within(:css, '.navbar') do
      	has_no_link?('Sign Up')
      	has_link?('Logout')
      end
    end

    it "should fail registration" do
    	visit "/users/new"
    	user = FactoryGirl.build(:user)

    	fill_in "user[email]", :with => user.email
    	click_button "Create Account"
    	expect(current_path).to eq(users_path)

    	page.should have_no_content("Account created")
    	expect(page).to have_no_content("Account created")
    end
  end
end
