require 'factory_girl'

FactoryGirl.define do
	factory :category do
		description		Faker::Lorem.word

		factory :category_with_words do
			ignore do
				words_count 3
			end

			after(:create) do |category, evaluator| 
				FactoryGirl.create_list(:word, evaluator.words_count, category: category)
			end
		end
	end
end
