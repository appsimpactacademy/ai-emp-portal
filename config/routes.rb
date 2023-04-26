Rails.application.routes.draw do
  devise_for :employees, controllers: {
    sessions: 'employees/sessions',
    passwords: 'employees/passwords',
    confirmations: 'employees/confirmations'
  }
  
  root 'home#index'

  namespace :admin do 
    resources :employees
    resources :leave_types
    resources :leave_applications
  end

  namespace :employee do
    resources :leave_applications
    get 'dashboard' => 'dashboard#index'
    get 'profile' => 'dashboard#profile'
  end 

  
end
