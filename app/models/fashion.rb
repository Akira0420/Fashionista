class Fashion < ApplicationRecord
    mount_uploader :image, ImageUploader
    acts_as_taggable
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    default_scope ->  {order(created_at: :desc)}
end
