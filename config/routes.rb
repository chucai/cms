Cms::Application.routes.draw do

  resources :navigations


  mount UeditorRails::Engine => '/ueditor'

  resources :pages, :only => [:show]

  namespace :admin do
    resources :companies
    resources :pages
    resources :ueditor do
      collection do
        post :images
        post :upload
      end
    end
    resources :images
  end

  scope "/admin/" do 
    resources :snippets
    resources :templates
    resources :navigations
  end

  match "home/work"  => "home#work"
  match "home/intro" => "home#intro"
  match "home/idea"  => "home#idea"
  match "/admin"      => "companies#index", :module => :admin

  root :to => "home#index"
end
