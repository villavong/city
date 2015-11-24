Rails.application.routes.draw do
  devise_for :students




  resources :students, only: [:index, :show] do
    resources :posts
  end
  authenticated :student do
    root 'students#dashboard', as:"authenticated_root"
  end
  root 'welcome#index'

end
