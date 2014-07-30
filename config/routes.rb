Rails.application.routes.draw do
  resources :fruits, only: %i(index show) do
    put :sort
  end

  root to: 'fruits#index'
end
