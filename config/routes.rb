Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  resources :contacts do
    patch :hide_contact, on: :member
    get :csv_download, on: :collection
    resources :phones
  end

  root 'contacts#index'
end
