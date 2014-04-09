Rails.application.routes.draw do
  resources :todo_lists

  root 'projects#index'
  resources :projects
end
