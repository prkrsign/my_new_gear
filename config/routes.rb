Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               omniauth_callbacks: 'users/omniauth_callbacks',
               sessions: 'users/sessions',
               registrations: "users/registrations"
             }

  root to: 'gears#index'

  get  'gears/search', to: 'gears#search'
  post 'photos/:id/:user_id', to: 'photos#show'

  resources :gears, only: %i[show search] do
    resources :reviews, only: %i[new edit update create destroy]
  end

  resources :review do
    member do
      resources :likes, only: %i[create destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
