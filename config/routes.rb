Rails.application.routes.draw do
  devise_for :users

  resources :users do
  	resources :relationships
  end

  root 'homes#top'

  resources :nails do
  	resource :favorites, only:[:create, :destroy]
  	resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
