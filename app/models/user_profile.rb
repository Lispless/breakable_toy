class UserProfile < ActiveRecord::Base
  belongs_to :user

  validates :motto, presence: true
  validates :bio, presence: true
  validates :interests, presence: true
end
