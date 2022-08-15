Rails.application.routes.draw do
  namespace :admin do
    get 'home/index'
    resources :categories
  end
end
