class User < ActiveRecord::Base
	has_many :questions
	has_many :answers
	validates :name,  presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
	validates :admin, presence: true
	validates :sex, presence: true
	validates :institute, presence: true, length: { maximum: 50 }
	validates :phonenumber, presence: true, length: { maximum: 20 }
	validates :field, presence: true , length: {maximum: 50}

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
