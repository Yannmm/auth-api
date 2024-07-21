Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/member_details' => 'members#index'

  namespace :api do
    namespace :v1 do
      resources :companies
    end
  end

  get 'cookies/create', as: 'set_cookie'
  get 'cookies/show', as: 'get_cookie'
end
