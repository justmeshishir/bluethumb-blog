Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :posts, only: %i[index show new create] do
    resources :comments, only: :create
  end
end
