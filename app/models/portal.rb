class Portal < ActiveRecord::Base
	has_many :answers
	has_many :recent
end
