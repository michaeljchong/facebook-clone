class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true, optional: true
end
