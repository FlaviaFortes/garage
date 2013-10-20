Rumble::Application.routes.draw do
  root :to => "artists#index"

  resources :artists do
    resources :photos, only: [:index, :new, :create, :destroy]
  end
end
