class Message < ApplicationRecord
  # validations
  validates :message, presence: true, length: { minimum: 10 }
  validates :user, presence: true

  # relationships
  belongs_to :user
  has_many :comments
end
