Rails.application.routes.draw do
  root 'users#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }

  delete '/users/sign_out' => 'devise/sessions#destroy'

end
