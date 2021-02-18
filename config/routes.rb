Rails.application.routes.draw do
  # resources :users, only: [:index, :show]

  get '/users/:id/account' => "users#index", as: 'account_user'
  get '/users/:id/profile' => "users#show", as: 'profile_user'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
