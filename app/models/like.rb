class Like < ApplicationRecord
  belongs_to :fashion
  belongs_to :user
  validates_uniqueness_of :fashion_id, scope: :user_id
end
