Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users, only: [:index, :show]
  resources :books do
    resources :words
    resource :bookmarks, only: [:show, :create, :destroy]
    resources :comments, only: [:index, :create, :destroy]
    collection do
      get 'search','quiz_index'
    end
    resource :quiz, only: [:new, :show]
  end
end