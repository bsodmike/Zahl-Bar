CoreApp::Application.routes.draw do

  get "payments/index"

  get "transaction_create/index"

  root :to => 'public#index'
  devise_for :users, :path => "login"

  namespace :admin do
    root :to => 'dashboard#index'
    resources :online_shops do
      resources :transactions
    end
    resources :offline_partners do
      resources :payments
    end
  end

end
