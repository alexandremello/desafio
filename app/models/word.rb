class Word < ActiveRecord::Base
	# validacoes
	validates_presence_of :word, :category_id
	validates_uniqueness_of :word, scope: :category_id

	belongs_to :category
end
