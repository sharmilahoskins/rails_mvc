Rails.application.routes.draw do
  get 'users/index'

  get 'users/register'
  post 'users/register'
  get 'users/login'
  get 'users/welcome'
  get 'users/logout'
  root 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
