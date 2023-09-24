Rails.application.routes.draw do
  root 'users#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  delete '/users/sign_out' => 'devise/sessions#destroy'

  get '/skills', to: 'skills#index'

  resources :categories do
    resources :skills
  end

  resources :users, only: [:index, :show, :edit, :update]

  resources :works do
    resources :languages
  end
end
