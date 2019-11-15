Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create] do
    member do
      resources :doses, only: [:create, :new, :destroy]
    end
  end

end
