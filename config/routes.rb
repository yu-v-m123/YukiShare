Rails.application.routes.draw do
  get 'reservation/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  get '/top' => "rooms#top"

  devise_scope :user do
    delete '/users' => 'users/sessions#destroy'
    get 'users/account' => 'users/registrations#account_index', as: 'account_user_registration'
    get 'users/profile' => 'users/registrations#profile_edit', as: 'profile_user_registration'
    patch 'users/update' => 'users/registrations#profile_update', as: 'profile_update_user_registration'
    patch '/users' => 'users/registrations#update_edit', as: 'update_user_registration'
  end
  
  get "/rooms/new" => "rooms#new", as: "new_room"
  post "/rooms/create" => "rooms#create", as: "room"
  get "/rooms/index" => "rooms#index", as: "index_room"
  get "/rooms/posts" => "rooms#show", as: "post_room"
  get "/rooms/:id" => "rooms#edit", as: "edit_room"
  
  resources :rooms do
    resources :reservation
    post "reservation/confirm" => "reservation#confirm"
    post "reservation/create" => "reservation#create"
  end 

  get "/reservations/index" => "reservation#index", as: "index_reservation"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
