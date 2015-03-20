Rails.application.routes.draw do
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :users, except: [:destroy]
  resources :courses do
    resources :results, only: [:create, :show, :update]
  end

  namespace :admin do
    resources :users, only: [:destroy]
  end
end
