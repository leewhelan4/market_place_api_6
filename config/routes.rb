Rails.application.routes.draw do

  namespace :api , defaults: { format: :json } do
    namespace :v1 do

      # Users
      resources :users, only: [:show, :create, :update, :destroy]

      # Tokens
      resources :tokens, only: [:create]

    end
  end
end
