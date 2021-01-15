Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users, only: [:index, :show]
  resources :books do
    resources :words, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end