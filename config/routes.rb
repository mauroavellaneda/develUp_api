Rails.application.routes.draw do
  namespace :api do
    resources :assignments, only: :index
  end
end
