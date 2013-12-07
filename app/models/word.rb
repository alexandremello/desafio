class Word < ActiveRecord::Base
	# validacoes
	validates_presence_of :word

	belongs_to :category
end
