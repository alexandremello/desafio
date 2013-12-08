require 'factory_girl'

FactoryGirl.define do
	factory :word do
		sequence(:word)	{ |i| Faker::Lorem.word+i.to_s }
		association		:category
	end
end
