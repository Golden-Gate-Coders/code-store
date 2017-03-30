Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "products#index"

  # Restful routes

  # Index
  get "/products" => "products#index"

  # New and Create
  get "/products/new" => "products#new"
  post "/products" => "products#create"

  # Show
  get "/products/:id" => "products#show"

  # Edit and Update
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"

  # Delete
  delete "/products/:id" => "products#destroy"

  # Search
  post "/search" => "products#search"

  # Signup
  get "/signup" => "users#new"
  post "/users" => "users#create"

  # Login
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"

  # Logout
  get "/logout" => "sessions#destroy"


  # Order form
  post "/orders" => "orders#create"

  # Order show page
  get "/orders/:id" => "orders#show"


  # Carted products
  post "/carted_products" => "carted_products#create"
  get "/cart" => "carted_products#index"

  delete "/carted_products/:id" => "carted_products#destroy"


end
