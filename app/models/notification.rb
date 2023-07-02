class Notification < ApplicationRecord
  belongs_to :user

  scope :requests, -> { where(category: "request") }
  scope :comments, -> { where(category: "comment") }
  scope :likes, -> { where(category: "like") }
end
