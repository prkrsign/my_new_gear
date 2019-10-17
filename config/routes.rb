Rails.application.routes.draw do
  devise_for :users
  root to: 'gears#index'

  get 'gears/search', to: 'gears#search'

  resources :gears, only: %i(new create show destroy edit update search) do
    resources :likes, only: %i(create destroy)
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
