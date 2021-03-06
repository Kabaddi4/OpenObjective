class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :targets

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed #フォローしてるユーザー
  has_many :follower_user, through: :followed, source: :follower #フォロワー

  has_many :favorites

  #フォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  #フォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end
end
