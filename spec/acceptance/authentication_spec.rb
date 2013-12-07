require 'spec_helper'

describe 'Authentication', type: :request do
	it 'should request to sign in' do
		visit '/categories'
		current_path.should == new_user_session_path
	end

	it 'should sign in successfully' do
		user = FactoryGirl.create(:user)
		visit '/users/sign_in'
		fill_in 'E-mail', with: user.email
		fill_in 'Senha', with: user.password
		click_on 'Sign in'
		current_path.should == root_path
	end

	it 'should not sign in successfully' do
		visit '/users/sign_in'
		fill_in 'E-mail', with: 'foo@abcd.com'
		fill_in 'Senha', with: 'foo'
		click_on 'Sign in'
		current_path.should == new_user_session_path
	end
end