Rails.application.routes.draw do
  root 'static_pages#home'

  resources :recipes do
    member do
      post :like
    end
  end

  resources :chefs, except: [:new, :destroy]

  get '/register' => 'chefs#new'

  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'
  post '/login' => 'sessions#create'

  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]

end
