require 'spec_helper'

describe Category do
	it 'has a valid factory' do
		FactoryGirl.build(:category).should be_valid
	end
	
	context 'should validate' do
		context 'presence of' do
			it 'description' do
				FactoryGirl.build(:category, description: nil).should_not be_valid
			end
		end
		context 'uniqueness of' do
			it 'description' do
				c = FactoryGirl.create(:category)
				FactoryGirl.build(:category, description: c.description).should_not be_valid
			end
		end
	end

	context 'should respond to' do
		let(:c) { FactoryGirl.create(:category) }

		it 'image' do
			c.should respond_to :image
		end

		it 'words' do
			c.should respond_to :words
		end
	end

	it 'should destroy words on delete' do
		category = FactoryGirl.create(:category_with_words)
		category_id = category.id
		category.destroy
		Word.where(category_id: category_id).count.should equal(0)
	end
end
