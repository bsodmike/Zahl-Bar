CoreApp::Application.routes.draw do
  get "public/index"

  root :to => 'public#index'

end
