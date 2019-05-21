Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get 'login' => 'authentication#login'
    post 'register' => 'authentication#register'
    get 'me' => 'users#me'
    resources :users, only: %i[index show]
  end

  get 'login' => 'api/authentication#login'
  post 'register' => 'api/authentication#register'
end
