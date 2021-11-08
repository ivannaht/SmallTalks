class Comment < ApplicationRecord
  validates :body, presence: true
  validates :body, format: {with: /[A-Za-z0-9_]{3,15}/}
  
  belongs_to :user
  belongs_to :talk

  belongs_to  :parent, class_name: 'Comment', optional: true
  has_many    :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  
  

end
