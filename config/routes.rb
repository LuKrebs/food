Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'restaurants#index'

  resources :restaurants do
    resources :reviews, only: [ :index, :new, :create ]
    collection do                       # collection => no restaurant id in URL
      get 'top', to: "restaurants#top"  # RestaurantsController#top
    end

    member do                             # member => restaurant id in URL
      get 'chef', to: "restaurants#chef"  # RestaurantsController#chef
    end
  end
  resources :reviews, only: [ :show, :edit, :update, :destroy ]

  namespace :admin do
    resources :restaurants, only: [:index]
  end
end
