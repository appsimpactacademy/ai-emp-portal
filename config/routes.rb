Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do 
    resources :employees
    resources :leave_types
    resources :leave_applications
  end

  namespace :employee do 
    get 'dashboard' => 'dashboard#index'
    get 'profile' => 'dashboard#profile'
  end 
end
