require 'rails_helper'

RSpec.describe Message, type: :model do
  before(:each) do
    @user = User.create(username: "Cesar")
  end
  context "With valid attributes" do
    it "should save" do
      message = Message.create(message: "Hello, how are you today?", user: @user)
      expect(message).to be_valid
    end
  end
  context "With invalid attributes" do
    it "should not save if message is empty" do
      message = Message.create(message: "", user: @user)
      expect(message).to be_invalid
    end
    it "should not save if message length is less than 10" do
      message = Message.create(message: "Hello", user: @user)
      expect(message).to be_invalid
    end
    it "should not save if message have no user" do
      message = Message.create(message: "Hello, how are you today?")
      expect(message).to be_invalid
    end
  end
end
