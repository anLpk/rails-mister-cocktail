Rails.application.routes.draw do
  devise_for :users
  root "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, except: :destroy
  end
  resources :doses, only: :destroy
end
