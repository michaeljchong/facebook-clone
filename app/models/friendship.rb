class Friendship < ApplicationRecord
  belongs_to :requester, class_name: "User", foreign_key: :requester_id
  belongs_to :requestee, class_name: "User", foreign_key: :requestee_id

  scope :friends, -> { where('accepted = ?', true) }
  scope :not_friends, -> { where('accepted = ?', false) }
end
