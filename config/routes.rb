Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users, only: [:index, :show]
  resources :books, only: [:index, :new, :create, :show, :edit, :update]
end