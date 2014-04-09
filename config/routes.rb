Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :todo_lists
  end
end
