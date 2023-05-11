class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friend_requester, class_name: "Friendship", foreign_key: :requester_id, inverse_of: 'requester', dependent: :destroy
  has_many :friend_requestee, class_name: "Friendship", foreign_key: :requestee_id, inverse_of: 'requestee', dependent: :destroy
  has_many :friends, -> { merge(Friendship.friends) }, through: :friend_requester, source: :requestee
  has_many :sent_requests, -> { merge(Friendship.not_friends) }, through: :friend_requester, source: :requestee
  has_many :received_requests, -> { merge(Friendship.not_friends) }, through: :friend_requestee, source: :requester

  def visible_posts
    combined_posts = posts.all
    friends.each do |friend|
      friend.posts.each do |post|
        combined_posts << post
      end
    end
    combined_posts
  end

  def name
    "#{first_name} #{last_name}"
  end
end
