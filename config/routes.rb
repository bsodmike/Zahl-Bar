CoreApp::Application.routes.draw do
  devise_for :users

  get "public/index"

  root :to => 'public#index'

end
