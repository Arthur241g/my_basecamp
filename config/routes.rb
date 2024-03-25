Rails.application.routes.draw do
  resources :truetasks
  
  resources :attaches

  resources :old2_attachments
  
  resources :discussions do
    resources :messages
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :projects

  resources :use

  get 'log/login'

  get 'log/signup'

  root "log#index"

end