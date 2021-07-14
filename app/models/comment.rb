class Comment < ApplicationRecord
  # validations
  validates :comment, presence: true, length: { minimum: 10}
  validates :message, :user, presence: true

  # relationships 
  belongs_to :message
  belongs_to :user
end
