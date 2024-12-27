Rails.application.routes.draw do
  resources :tasks do
  collection do
    get :search
  end
end
  devise_for :users, controllers:  {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :workspaces do
    post :add_member, on: :member
  end
  #  post 'auth/login', to: 'auth#create'
end
