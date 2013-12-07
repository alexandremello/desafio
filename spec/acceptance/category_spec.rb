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
			fill_in "Description", with: 'Novelas'
			click_button 'Salvar'
			current_path.should == root_path
			page.should have_content 'Novelas'
		end

		it 'shows a category' do
			c = FactoryGirl.create(:category)
			visit categories_path
			click_on c.description
			current_path.should == category_path

			page.should have_content c.description
		end
	end

	context 'PUT /categories' do 
		it 'edits a category' do
			c = FactoryGirl.create(:category)
			visit categories_path
			click_on 'Editar'
			current_path.should == edit_category_path(c.id)

			find_field('Description').value.should == c.description
			fill_in 'Description', with: 'updated'
			click_on 'Salvar'

			current_path.should == root_path
			page.should have_content 'updated'
		end
	end

	context 'DELETE /categories'
	xit 'deletes a category' do
		c = FactoryGirl.create(:category)
		visit categories_path
		click_on 'Excluir'
		page.driver.browser.switch_to.alert.accept
		page.should_no have_content c.description
	end
end
