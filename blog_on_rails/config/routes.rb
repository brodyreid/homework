Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get "/posts/new" => "posts#new", as: :new_post
  # post "/posts" => "posts#create", as: :posts

  # get "/posts/:id" => "posts#show", as: :post

  # # get "/post" => "posts#index", as: :root
  # get "/" => "posts#index", as: :root

  # get "/posts/:id/edit" => "posts#edit", as: :edit_post

  # patch "/posts/:id" => "posts#update"

  # delete "/posts/:id" => "posts#destroy"

  root to: redirect(path: "/posts")

  resources :posts do
    resources :comments, only: [:create, :destroy], shallow: true
  end

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]
end
