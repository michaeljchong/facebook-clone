class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friend_requester, class_name: "Friendship", foreign_key: :requester_id, inverse_of: 'requester', dependent: :destroy
  has_many :friend_requestee, class_name: "Friendship", foreign_key: :requestee_id, inverse_of: 'requestee', dependent: :destroy
  has_many :friends, -> { merge(Friendship.friends) }, through: :friend_requester, source: :requestee
  has_many :sent_requests, -> { merge(Friendship.not_friends) }, through: :friend_requester, source: :requestee
  has_many :received_requests, -> { merge(Friendship.not_friends) }, through: :friend_requestee, source: :requester
  has_many :notifications, dependent: :destroy

  def visible_posts
    combined_posts = []
    posts.each do |post|
      combined_posts << post
    end

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

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.name   # assuming the user model has a name
      user.profile_img = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
