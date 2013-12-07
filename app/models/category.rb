class Category < ActiveRecord::Base
	# validações
	validates_presence_of :description
end
