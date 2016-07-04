class Admin < ActiveRecord::Base
	before_save :downcase_email
	validates :email, presence: true, 
		format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, 
		uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	def Admin.digest(string)
    	BCrypt::Password.create(string)
  	end

	private
		def downcase_email
			self.email = email.downcase
		end
end
