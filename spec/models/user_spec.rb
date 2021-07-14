require 'rails_helper'

RSpec.describe User, type: :model do
  context "With valid attributes" do
    it "should save" do
      user = User.create(username: "Cesar")
      expect(user).to be_valid
    end
  end
  context "With invalid attributes" do
    it "should not save if username is empty" do
      user = User.create(username: "")
      expect(user).to be_invalid
    end
    it "should not save if username already exist" do
      user1 = User.create(username: "Cesar")
      user2 = User.create(username: "Cesar")
      expect(user2).to be_invalid
    end
    it "should not save if username length is less than 5" do
      user = User.create(username: "Ces")
      expect(user).to be_invalid
    end
  end
end
