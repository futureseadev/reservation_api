Rails.application.routes.draw do
  post 'users' => 'users#create'
  get 'vehicles' => 'vehicles#index'
  post 'reservations' => 'reservations#create'
end
