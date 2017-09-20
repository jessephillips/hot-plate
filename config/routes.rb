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
  end

  get 'pages/index'

  root 'pages#index'
end
