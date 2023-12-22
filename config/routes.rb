Rails.application.routes.draw do

  devise_for :users

  resources :projects

  get 'log/login'

  get 'log/signup'

  root "log#index"

end
