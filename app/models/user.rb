class User < ApplicationRecordc

	# self.table_name = "admin_users"

	has_secure_password

	scope :sorted, lambda {order("last_name ASC, first_name ASC")}

	EMAIL_REGEX = /\A.+@.+(\..+)?/i

	validates :first_name,
		:presence => true,
		:length => { :maximum => 25 }
	validates :last_name,
		:presence => true,
		:length => { :maximum => 50 }
	validates :email,
		:presence => true,
		:length => { :maximum => 100 },
		:format => EMAIL_REGEX,
		:confirmation => true

	def name
		"#{first} #{last_name}"
	end
end

