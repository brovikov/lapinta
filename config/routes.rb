Rails.application.routes.draw do
  resources :reviews
  mount Ckeditor::Engine => '/ckeditor'
  get 'welcome', to: 'static#welcome'

  root to: 'static#welcome'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
