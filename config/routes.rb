Rails.application.routes.draw do
  post 'users' => 'users#create'
  get 'vehicles' => 'vehicles#index'
end
