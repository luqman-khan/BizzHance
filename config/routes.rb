Rails.application.routes.draw do
 
  get 'sales' => 'sales#index'
  get 'repairs' => 'repairs#index'
  resources :repairs, only: [:new,:create]
  resources :sales, only: [:new,:create]
  resources :customers do
      resources :repairs
      resources :sales
  end

   	resources :organizations do
  		resources :users
  	end
  	devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
        # passwords: 'users/passwords'
    }
    resources :users do
    	root to: 'users/registrations#new'
      resources :attendances
    end
    root to: 'customers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
