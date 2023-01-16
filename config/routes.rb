Rails.application.routes.draw do
  devise_for :users
  resources :job_applications, only: [:index, :create] 
  
  resources :jobs do
    resources :job_applications
  end
  resources :companies 
  resources :applicants do
    resources :job_applications
  end
  
  root "jobs#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
