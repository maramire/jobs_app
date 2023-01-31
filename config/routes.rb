Rails.application.routes.draw do
  get 'search/index'
  get 'search', to: 'search#index'
  devise_for :users
  resources :job_applications, only: [:index, :create] 
  
  resources :jobs do
    resources :job_applications, only: [:show, :new, :destroy] 
  end
  resources :companies 
  resources :applicants do
    resources :job_applications
  end
  
  root "jobs#index"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
