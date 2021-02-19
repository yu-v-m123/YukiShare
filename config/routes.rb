Rails.application.routes.draw do
  # resources :users, only: [:index, :show]

  # get '/users/:id/account' => "users#index", as: 'account_user'
  # get '/users/:id/profile' => "users#edit", as: 'profile_user'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users' => 'users/sessions#destroy'
    get 'users/account' => 'users/registrations#account_index', as: 'account_user_registration'
    get 'users/profile' => 'users/registrations#profile_edit', as: 'profile_user_registration'
    patch '/users' => 'users/registrations#update_edit', as: 'update_user_registration'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
