Rails.application.routes.draw do
  root 'projects#index'
  
  resources :searches

  resources :projects do
    resources :todo_lists do
      resources :todo_items do
        post :toggle, on: :member
        get :cancel_edit, on: :member
        post :position, on: :collection
      end

      get :cancel_edit, on: :member
      get :show_all_items, on: :member
      post :position, on: :collection
      
      resources :drop_items
    end

    resources :completed_todo_lists
    resources :writings
  end
end
