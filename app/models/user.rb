class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :first_name, :last_name, :nickname, :dob, :age, presence: true 
  
  validates :first_name, :last_name, format: {with: /[A-Za-z]{5,50}/}

  validates :email, uniqueness: true, format: {with: /[a-z0-9_]{5,50}/}

  validates :age, numericality: {greate_than: 18, less_than: 110}, on: :create
   
  


  #relationship       
  has_many :talks
  has_one_attached :photo
  
end
