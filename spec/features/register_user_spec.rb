require 'rails_helper'
feature "guest user creates an account" do
    before(:each) do
        visit '/users/new'
    end
    scenario "successfully login or creates a new user account" do
        fill_in "username", with: "Cesar"
        click_button "Sign In"
        expect(page).to have_content('Welcome Cesar!')
        # We'll be redirecting to the messages page if user succesfully logged in or created an account
        expect(page).to have_current_path('/messages')
    end
    scenario "should have an error if username is empty" do
        fill_in "username", with: ""
        click_button "Sign In"
        expect(page).to have_content "Username can't be blank"
    end
    scenario "should have an error if username is less than 5 characters" do
        fill_in "username", with: ""
        click_button "Sign In"
        expect(page).to have_content "Username is too short (minimum is 5 characters)"
    end
end