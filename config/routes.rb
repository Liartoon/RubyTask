Rails.application.routes.draw do
  
  devise_for :auth_users
  root to:'main_page#MainPageGen'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match "/tasks/:id/edit" => "tasks#edit", :via => :post
  resources :tasks
end
