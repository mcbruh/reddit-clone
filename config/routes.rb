Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, only: [:index, :new, :create, :show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:new, :create, :show]

  root to: redirect('/subs')
end
