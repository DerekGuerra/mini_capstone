Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do 
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    patch '/products/:id' => 'products#update'
    delete 'products/:id' => 'products#destroy'

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
    post "/order" => "orders#create"

    get '/carted_product' => 'carted_products#index'
    post '/carted_product' => 'carted_products#create'
    delete '/carted_product/:id' => 'carted_products#destroy'

  end
end
