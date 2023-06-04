Rails.application.routes.draw do
  resources :series, only: [:index, :show] do
    resources :episodes, only: [:index, :show] do
    end
  end

  # root 'articles#index'
end
