Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do 
    resources :employees
    resources :leave_types
  end
end
