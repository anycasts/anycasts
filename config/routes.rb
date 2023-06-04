Rails.application.routes.draw do

  # root 'articles#index'

  resources :series, only: [:show] do
    resources :episodes, only: [:show] do
    end
  end

  namespace :dashboard do
    resources :courses, except: [:show] do
      resources :lessons, shallow: true, except: [:show]
    end
  end
end
