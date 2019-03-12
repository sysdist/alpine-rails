Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'
  root to: 'visitors#index'

  #get 'users/:id/menu', to: 'users#menu', as: :menu_user
end
