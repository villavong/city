Rails.application.routes.draw do
  devise_for :students




  resources :students, only: [:index, :show] do
    resources :posts
  end
  authenticated :student do
    root 'welcome#index', as:"authenticated_root"
  end
  root 'welcome#index'

end
