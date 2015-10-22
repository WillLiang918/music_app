Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resources :session, only: [:new, :create, :destroy]
  resources :bands do
    resources :albums, only: [:new] do
    end
  end

  resources :albums, except: [:index, :new] do
    resources :tracks, only: [:new]
  end

  resources :tracks, except: [:index, :new]
end
