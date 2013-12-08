require 'spec_helper'
describe Word, type: :request do
	let(:c) { FactoryGirl.create(:category) }
	before(:each) { sign_in }

	context 'GET /categories/words' do
		
		it 'display some words' do
			w = FactoryGirl.create(:word, category: c)
			visit category_path(c.id)
			page.should have_content w.word
		end

		it 'creates a new word' do
			visit category_path(c.id)
			fill_in "word_word", with: 'Saramandaia'
			click_button 'Adicionar'
			current_path.should == category_path(c.id)
			page.should have_content 'Saramandaia'
		end
	end

	context 'DELETE /categories'
	xit 'deletes a word' do
		w = FactoryGirl.create(:word, category: c)
		visit category_path(c.id)
		-> { page.find(:xpath, "//a[@href='#{category_word_path(c.id, w.id)}']").click }.should change(Word, :count).by(-1)
		# page.find(:xpath, "//a[@href='#{category_word_path(c.id, w.id)}']").click
		# current_path.should == category_path(c.id)
		# page.should_not have_content w.word
	end
end