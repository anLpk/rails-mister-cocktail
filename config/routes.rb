Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, except: :destroy
  end
  resources :doses, only: :destroy
end
