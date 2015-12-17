class Application < ActiveRecord::Base
	belongs_to :jobs 
	belongs_to :students
end
