Rails.application.routes.draw do
  namespace :admin do
    get 'home/index'
    resources :categories
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
