class User < ActiveRecord::Base
	has_many :orders
	has_secure_password
	validates :first_name, :last_name, :email, presence: true
	validates :email, uniqueness: true
end
