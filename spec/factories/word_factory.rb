require 'factory_girl'

FactoryGirl.define do
	factory :word do
		word			Faker::Lorem.word
		association		:category
	end
end
