Rails.application.routes.draw do
  root to: "home#index"

  resources :wines
  resources :vendors
  resources :favorites
  resources :notes
  resources :alerts

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  get '/autocomplete', to: 'wines#autocomplete'
  devise_scope :user do
    get '/expert/:id', to: 'users/sessions#expert', as: "expert"
    get '/admin/:id', to: 'users/sessions#admin', as: "admin"
    post 'users/:id/impersonate', to: 'users/sessions#impersonate', as: "impersonate"
    post 'users/impersonate', to: 'users/sessions#stop_inpersonate', as: "stop_inpersonate"
    post 'users/change_role_user', to: 'users/sessions#change_role_user', as: "user_change_role"
  end
  # resources :users, only: [:index] do
  #   post :impersonate, on: :member
  #   post :stop_impersonating, on: :collection
  # end
  
end
