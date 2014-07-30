Rails.application.routes.draw do
  resources :fruits do
    put :sort
  end

  root to: 'fruits#index'
end
