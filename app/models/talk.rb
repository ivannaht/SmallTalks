class Talk < ApplicationRecord
  #validation
  validates :title, :text, :photo, :theme, presence: true 
  
  validates :title, uniqueness: true, format: {with: /[A-Za-z0-9_]{3,30}/}
  validates :theme, format: {with: /[A-Za-z0-9_]{3,15}/}

 
  #ralationship
  belongs_to :user
  has_one_attached :photo
  acts_as_favoritable
  
end
