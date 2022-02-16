class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :targets
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id"
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id"
end
