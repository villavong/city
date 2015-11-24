Rails.application.routes.draw do
  devise_for :students


  root 'welcome#index'


  resources :students, only: [:index, :show]

end
