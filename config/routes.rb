Rails.application.routes.draw do
  resources :microposts do
    collection do
      match 'search' => 'microposts#search', via: [:get, :post], as: :search
    end
  end
  resources :users
  resources :students do
    collection do
      match 'search' => 'students#search', via: [:get, :post], as: :search
    end
  end
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
