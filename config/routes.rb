Cms::Application.routes.draw do
  namespace :admin do
    resources :companies
  end

  root :to => "home#index"
end
