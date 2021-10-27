Rails.application.routes.draw do
  root to: 'pokemon#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pokemon
end
