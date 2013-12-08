class Category < ActiveRecord::Base
	# paperclip
	has_attached_file :image, styles: { xsmall: "124x124>", small: "139x139>", 
										medium: "210x210>", large: "247x247", 
										xlarge: "279x279>" }, 
										:default_url => ":style_missing.jpg"

	# validações
	validates_presence_of 	:description
	validates_uniqueness_of :description

	has_many :words, dependent: :destroy
end
