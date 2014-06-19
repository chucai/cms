Cms::Application.routes.draw do
  resources :companies


  root :to => "home#index"
end
