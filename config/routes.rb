Rails.application.routes.draw do
  root 'users#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
