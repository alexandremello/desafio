require 'spec_helper'

describe Category, type: :request do
	before(:each) { sign_in}

	context 'GET /categories' do
		it 'display some categories' do
			c = FactoryGirl.create(:category)
			visit categories_path
			page.should have_content c.description
		end

		it 'creates a new category' do
			visit categories_path
			click_on 'Nova categoria'
			fill_in "Description", :with => 'Novelas'
			click_button 'Salvar'
			current_path.should == root_path
			page.should have_content 'Novelas'
		end
	end

	context 'DELETE /categories'
	it 'deletes a category' do
		c = FactoryGirl.create(:category)
		visit categories_path
		click_on 'Excluir'
		page.driver.browser.switch_to.alert.accept
		page.should_no have_content c.description
	end
end
