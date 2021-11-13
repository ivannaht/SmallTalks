class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :first_name, :last_name, :nickname, :dob, presence: true 
  
  validates :first_name, :last_name, format: {with: /[A-Za-z]{2,50}/}

  validates :email, uniqueness: true, format: {with: /[a-z0-9_]{2,50}/}

  
  validate :validate_age

  
  


  #relationship       
  has_many :talks, dependent: :destroy
  has_one_attached :photo
  acts_as_favoritor
  has_one :feedback, dependent: :destroy
  has_many :comments, dependent: :destroy
  acts_as_voter

  def calculate_age(dob)
    ((Time.zone.now - dob.to_time) / 1.year.seconds).floor
  end

  private
  def validate_age
    if dob.present? && dob > 18.years.ago.to_date 
      errors.add(:dob, 'You should be over 18 years old.')
    elsif dob.present? && dob < 100.years.ago.to_date
      errors.add(:dob, 'You should be less than 100 years old.')
    end
  end

 


end
