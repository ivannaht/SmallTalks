class Talk < ApplicationRecord
  #validation
  validates :title, :text, :photo, :likes_number, :dislikes_number, :comments_number, :shares_number, presence: true 
  
  validates :title, uniqueness: true, format: {with: /[A-Za-z0-9_]{3,30}/}

  validates :likes_number, :dislikes_number, :comments_number, :shares_number, numericality: {greate_than_or_equal: 0}, on: :create

  #ralationship
  belongs_to :user
  has_one_attached :photo
  
end
