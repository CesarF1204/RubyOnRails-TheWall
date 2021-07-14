require 'rails_helper'
feature "user creates/post a comment on a message" do
    before(:each) do
        visit '/users/new'
        fill_in "username", with: "Cesar"
        click_button "Sign In"
        fill_in "message", with: "Hello, how are you?"
        click_button "Post a Message"
    end
    scenario "successfully posted a comment" do
        fill_in "comment", with: "I'm ok, and you?"
        click_button "Post a Comment"
        expect(page).to have_content("I'm ok, and you?")
    end
    scenario "should have an error if comment is empty" do
        fill_in "comment", with: ""
        click_button "Post a Comment"
        expect(page).to have_content("Comment can't be blank")
    end
    scenario "should have an error if comment is less than 10 characters" do
        fill_in "comment", with: "Hello"
        click_button "Post a Comment"
        expect(page).to have_content("Comment is too short (minimum is 10 characters)")
    end
end