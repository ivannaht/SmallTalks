class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :first_name, :last_name, :nickname, :dob, presence: true 
  
  validates :first_name, :last_name, format: {with: /[A-Za-z]{2,50}/}

  validates :email, uniqueness: true, format: {with: /[a-z0-9_]{2,50}/}

  

  
  


  #relationship       
  has_many :talks
  has_one_attached :photo
  acts_as_favoritor
  
end
