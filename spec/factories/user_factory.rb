require 'factory_girl'

FactoryGirl.define do
	factory :user do
		email		Faker::Internet.email
		password	Faker::Lorem.characters(8)
	end
end
