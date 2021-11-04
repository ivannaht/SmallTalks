class Feedback < ApplicationRecord
  validates :recommendation, :experience, presence: true 
  
  validates :experience, uniqueness: true



  belongs_to :user
end
