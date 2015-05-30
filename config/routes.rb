Rails.application.routes.draw do
  root 'static_pages#home'

  resources :recipes do
    member do
      post :like
    end
  end
end
