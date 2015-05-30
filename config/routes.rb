Rails.application.routes.draw do
  root 'static_pages#home'

  resources :recipes do
    member do
      post :like
    end
  end

  resources :chefs, except: [:new]

  get '/register' => 'chefs#new'

  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'
  post '/login' => 'sessions#create'
end
