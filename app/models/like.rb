class Like < ApplicationRecord
  belongs_to :user
  belongs_to :fashion
  validates_uniqueness_of :fashion_id, scope: :user_id
end
