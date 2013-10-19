Rumble::Application.routes.draw do

  root :to => "artists#index"

  resources :artists do
    resources :photos
  end
end
