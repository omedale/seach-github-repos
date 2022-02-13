Rails.application.routes.draw do
  root 'githubs#index'
  
  get "/githubs/index", to: "githubs#index" 
end
