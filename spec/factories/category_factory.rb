require 'factory_girl'

FactoryGirl.define do
	factory :category do
		description		Faker::Lorem.word
	end
end
