Rails.application.routes.draw do
  root 'users#new'

  resources :users, only: [:index, :new, :create] do
    resources :consents, only: [:index]
  end

  patch '/users/:user_id/consents/:purpose', to: 'consents#update', as: 'update_user_consent'
end