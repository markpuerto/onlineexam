Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sessions, path: 'sign-in', only: [:create, :new] do
    collection {
      get 'logout'
    }
  end
  resources :registrations, path: 'register', only: [:create, :new]
  resources :posts, except: [:index, :show, :destroy] do
    get 'delete', to: 'posts#destroy'
  end

  root 'posts#index'
end
