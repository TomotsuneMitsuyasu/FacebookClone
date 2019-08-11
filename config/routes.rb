Rails.application.routes.draw do
  get 'pictures/index'
  # get 'sessions/new'
  resources :users
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :sessions,only:[:new,:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
