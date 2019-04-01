Rails.application.routes.draw do
 
  resources :attendances
  resources :repairs
  resources :sales
  resources :customers
   	resources :organizations do
  		resources :users
  	end
  	devise_for :users, controllers: {
        sessions: 'users/sessions'
        # registrations: 'users/registrations',
        # passwords: 'users/passwords'
    }
    resources :users do
    	root to: 'users/registrations#new'
    end
    root to: 'organizations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
