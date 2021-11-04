class Talk < ApplicationRecord
  #validation
  validates :title, :text, :photo, presence: true 
  
  validates :title, uniqueness: true, format: {with: /[A-Za-z0-9_]{3,30}/}

 
  #ralationship
  belongs_to :user
  has_one_attached :photo
  acts_as_favoritable
  
end
