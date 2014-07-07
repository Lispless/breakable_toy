class User < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :user_name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :moto, presence: true
  validates :bio, presence: true
  validates :interests, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
