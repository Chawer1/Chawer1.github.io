Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'main#index'
  get '/users/destroy_selected', to: 'users#destroy_selected', as:
      :destroy_selected
  resources :user do
    collection do
      delete 'destroy'
    end
  end
end
