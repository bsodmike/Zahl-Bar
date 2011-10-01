CoreApp::Application.routes.draw do

  root :to => 'public#index'
  devise_for :users, :path => "login"

  namespace :admin do
    root :to => 'dashboard#index'

  end

end
