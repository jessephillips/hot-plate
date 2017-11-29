Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

     ###    ########  ##     ## #### ##    ##
    ## ##   ##     ## ###   ###  ##  ###   ##
   ##   ##  ##     ## #### ####  ##  ####  ##
  ##     ## ##     ## ## ### ##  ##  ## ## ##
  ######### ##     ## ##     ##  ##  ##  ####
  ##     ## ##     ## ##     ##  ##  ##   ###
  ##     ## ########  ##     ## #### ##    ##

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    resources :activities, only: [:index]
    resources :users, only: [:index, :show]
  end

  get 'pages/index'
  get 'pages/get'
  get 'pages/readme'

  resources :users, only: [] do
    resources :reviews, controller: :user_reviews
  end
  resources :reviews

  root 'pages#index'
end
