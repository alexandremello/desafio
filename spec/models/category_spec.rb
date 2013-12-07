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
	end
end
