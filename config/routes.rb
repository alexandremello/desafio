Desafio::Application.routes.draw do

	resources :categories

  devise_for :users do
	root :to => "devise/sessions#new"
  end

end
