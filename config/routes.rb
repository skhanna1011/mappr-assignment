Rails.application.routes.draw do

  namespace :api, format: :json do
    namespace :v1 do
      resources :products, only: [:index, :create, :show, :update, :destroy]
    end  
  end

  namespace :admin do
    root to: "products#index"
    resources :products, only: [:index, :destroy, :edit, :update]
  end
  root to: "admin/products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
