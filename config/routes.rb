Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to:'public/homes#top'

  namespace :admin do
    get 'admin' => 'homes#top', as: "top"
    get "/orders/customer/:id" => "orders#index", as: "orders_customer_index"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end



# 顧客用
# URL /customers/sign_in ...
   devise_for :customers,skip: [:passwords], controllers: {
     registrations: "public/registrations",
     sessions: 'public/sessions'
   }

  namespace :public do
    get "/" => "homes#top"
    get "about" => "homes#about"
    get "items" => "items#index", as: "items"
    get "items/:id" => "items#show", as: "items_show"
    get "customers/my_page" => "customers#show"
    get "customers/information/edit" => "customers#edit", as: "customer_edit"
    patch "customers/information" => "customers#update"
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
    get "cart_items" => "cart_items#index"
    patch "cart_items/:id" => "cart_items#update"
    delete "cart_items/:id" => "cart_items#destroy", as: "cart_items_destroy"
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    post "cart_items" => "cart_items#create"
    get "orders/new" => "orders#new"
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    post "orders" => "orders#create"
    get "orders" => "orders#index", as: "orders_index"
    get "orders/:id" => "orders#show"
    get "addresses" => "addresses#index"
    get "addresses/:id/edit" => "addresses#edit"
    post "addresses" => "addresses#create", as: "addresses_create"
    patch "addresses/:id" => "addresses#update"
    delete "addresses/:id" => "addresses#delete", as: "addresses_destroy"
    get "items/genres/:id" => "items#genre_index", as: "items_genre_index"
  end


  #get "customers" => "public/customers#show", as: "customer_show"
  #get "customers/unsubscribe/confirm" => "public/customers#confirm"
  #get "orders/new" => "public/orders#new"
  #post "orders/confirm" => "public/orders#confirm"
  #get "orders/complete" => "public/orders#complete"
  #get "orders/index" => "public/orders#index"
  #get "orders/:id" => "public/orders#show"
  #get "addresses" => "public/addresses#index"
  #get "addresses/:id/edit" => "public/addresses#edit", as: "edit_addresses"
  #post  "addresses" => "public/addresses#create"
  #patch "addresses/:id" => "public/addresses#update"
  #delete "addresses/:id" => "public/addresses#destroy", as: "destroy_address"
  #get "items/genres/:id" => "public/items#genre_index", as: "items_genre_index"


  #scope module: :public do
    #get "/" => "homes#top", as: "homes_top"
    #delete "cart_items/destroy_all" => "cart_items#destroy_all"
    #post "orders/confirm" => "orders#confirm"
    #get "orders/complete" => "orders#complete"
    # get "orders" => "orders#index"
    # get "orders/:id" => "orders#show"
    #resources :addresses
    #resources :cart_items, only: [:index, :update, :destroy, :create]
    #resources :orders, only: [:new, :create, :index, :show]
  #end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
