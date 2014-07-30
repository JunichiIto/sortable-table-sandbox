Rails.application.routes.draw do
  resources :fruits

  root to: 'fruits#index'
end
