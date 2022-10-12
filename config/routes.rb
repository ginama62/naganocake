Rails.application.routes.draw do

  devise_for :customers
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    root to:'homes#top'
    get "/orders/customer/:id" => "orders#index", as: "orders_customer_index"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

# 顧客用
# URL /customers/sign_in ...
# devise_for :customers,skip: [:passwords], controllers: {
  # registrations: "public/registrations",
  # sessions: 'public/sessions'
# }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
