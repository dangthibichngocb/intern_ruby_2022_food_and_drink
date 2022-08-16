Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    namespace :admin do
      get 'home/index'
    end

    get "dashboard", to: "dashboard#index"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
