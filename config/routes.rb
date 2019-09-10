Rails.application.routes.draw do
  
  devise_for :auth_users
  root to:'main_page#MainPageGen'
  get '/sql1', to: 'main_page#Sql1'
  get '/sql2', to: 'main_page#Sql2'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match "/tasks/:id/edit" => "tasks#edit", :via => :post
  match "/tasks/new" => "tasks#create", :via => :post
  resources :tasks
  
end
