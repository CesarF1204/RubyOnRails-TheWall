require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create(username: "Cesar")
    @message = Message.create(message: "Hello, how are you?", user: @user)
  end
  context "With valid attributes" do
    it "should save" do
      comment = Comment.create(comment: "I'm ok. how about you?", message: @message, user: @user)
      expect(comment).to be_valid
    end
  end
  context "With invalid attributes" do
    it "should not save if comment is empty" do
      comment = Comment.create(comment: "", message: @message, user: @user)
      expect(comment).to be_invalid
    end
    it "should not save if comment length is less than 10" do
      comment = Comment.create(comment: "Im ok", message: @message, user: @user)
      expect(comment).to be_invalid
    end
    it "should not save if comment has no message" do
      comment = Comment.create(comment: "Im ok", user: @user)
      expect(comment).to be_invalid
    end
    it "should not save if comment has no user" do
      comment = Comment.create(comment: "Im ok", message: @message)
      expect(comment).to be_invalid
    end
    it "should not save if comment has no message and user" do
      comment = Comment.create(comment: "Im ok")
      expect(comment).to be_invalid
    end
  end
end
