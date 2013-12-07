Desafio::Application.routes.draw do
	root :to => 'categories#index'

	resources :categories

	devise_for :users

end
