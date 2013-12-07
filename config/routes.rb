Desafio::Application.routes.draw do
	root :to => 'categories#index'

	resources :categories do
		resources :words
	end

	devise_for :users

end
