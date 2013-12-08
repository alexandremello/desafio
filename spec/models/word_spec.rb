require 'spec_helper'

describe Word do
	it 'has a valid factory' do
		FactoryGirl.build(:word).should be_valid
	end

	context 'should validate' do
		context 'presence of' do
			it 'word' do
				FactoryGirl.build(:word, word: nil).should_not be_valid
			end

			it 'category_id' do
				FactoryGirl.build(:word, category_id: nil).should_not be_valid
			end
		end

		context 'unequeness of' do
			it 'word and category_id' do
				w1 = FactoryGirl.create(:word)
				w2 = Word.new(word: w1.word, category_id: w1.category_id)
				w2.should_not be_valid
			end
		end
	end

	context 'should respond to' do
		it 'category' do
			w = FactoryGirl.create(:word)
			w.should respond_to :category
		end
	end
end