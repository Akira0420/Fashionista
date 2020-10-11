class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  has_many :fashions, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_fashions, through: :likes, source: :fashion
  has_many :comments, dependent: :destroy

  
  def already_liked?(fashion)
    self.likes.exists?(fashion_id: fashion.id)
  end
end
