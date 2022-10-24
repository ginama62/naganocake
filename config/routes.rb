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
    resources :items,       only: [:index, :show]
    # get "items" => "items#index", as: "items"
    # get "items/:id" => "items#show", as: "items_show"
    get "customers/my_page" => "customers#show"
    get "customers/information/edit" => "customers#edit", as: "customer_edit"
    patch "customers/information" => "customers#update"
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
    resources :cart_items,  only: [:index, :update, :destroy, :create]
    # get "cart_items" => "cart_items#index"
    # patch "cart_items/:id" => "cart_items#update"
    # delete "cart_items/:id" => "cart_items#destroy", as: "cart_items_destroy"
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    post "cart_items" => "cart_items#create"
    resources :orders,      only: [:new, :create, :index, :show]
    # get "orders/new" => "orders#new"
    get 'orders/confirm'  => "orders#confirm"
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    # post "orders" => "orders#create"
    # get "orders" => "orders#index", as: "orders_index"
    # get "orders/:id" => "orders#show"
    # get "addresses" => "addresses#index"
    # get "addresses/:id/edit" => "addresses#edit", as: "addresses_edit"
    # post "addresses" => "addresses#create", as: "addresses_create"
    # patch "addresses/:id" => "addresses#update"
    # delete "addresses/:id" => "addresses#destroy", as: "addresses_destroy"
    resources :addresses
    get "items/genres/:id" => "items#genre_index", as: "items_genre_index"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
