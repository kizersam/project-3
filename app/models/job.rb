class Job < ActiveRecord::Base
	belongs_to :companies

	has_many :applications
end
