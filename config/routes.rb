Rails.application.routes.draw do
  resources :guest_queues
  root 'guest_queues#index'
end
