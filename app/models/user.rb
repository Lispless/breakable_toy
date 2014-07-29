class User < ActiveRecord::Base
  has_many :posts
  has_one :user_profile

  validates :user_name, presence: true
  validates :first_name, presence: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  after_create :new_profile

  def new_profile
    UserProfile.create(user: self)
  end
end
