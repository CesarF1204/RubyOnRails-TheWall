require 'rails_helper'
feature "user creates/post a message" do
    before(:each) do
        visit '/users/new'
        fill_in "username", with: "Cesar"
        click_button "Sign In"
    end
    scenario "successfully posted a message" do
        fill_in "message", with: "Hello, how are you?"
        click_button "Post a Message"
        expect(page).to have_content('Hello, how are you?')
    end
    scenario "should have an error if message is empty" do
        fill_in "message", with: ""
        click_button "Post a Message"
        expect(page).to have_content("Message can't be blank")
    end
    scenario "should have an error if message is less than 10 characters" do
        fill_in "message", with: "Hello"
        click_button "Post a Message"
        expect(page).to have_content("Message is too short (minimum is 10 characters)")
    end
end