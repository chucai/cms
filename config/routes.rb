Cms::Application.routes.draw do
  namespace :admin do
    resources :companies
  end

  match "home/work"  => "home#work"
  match "home/intro" => "home#intro"
  match "home/idea"  => "home#idea"
  match "admin"      => "companies#index", :module => :admin

  root :to => "home#index"
end
