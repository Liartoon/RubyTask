Rails.application.routes.draw do
  root to:'main_page#MainPageGen'
  devise_for :auth_users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
end
