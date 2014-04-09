Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :todo_lists do
      resources :todo_items do
        post :toggle, on: :member
        post :position, on: :collection
      end
    end
  end
end
