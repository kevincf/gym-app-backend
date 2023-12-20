Rails.application.routes.draw do
  resources :exercises
  resources :sections
  resources :coaches
  resources :tenants do
    resources :programs do
      resources :workouts
    end
    resources :members do
      collection do
        post :invite
      end
    end
  end
  devise_for :users
  root 'static_pages#landing_page'
  get 'dashboard', to: 'static_pages#dashboard'
  get 'Tenants', to: 'tenants#index'
end
