Rails.application.routes.draw do
  
  resources :jobs

  resources :companies do
    resources :jobs
  end
  
  resources :applicants do
    resources :job_applications
  end
  
  root "jobs#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
