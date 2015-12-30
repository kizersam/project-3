Rails.application.routes.draw do
  
  devise_for :companies, controllers: {company: "company", registrations: "companies/registrations"}
  devise_for :students, controllers: { student: "student", registrations: "students/registrations"}
  
  root 'welcome#index'


   resources :student do
   		get '/jobs', to: "student#jobs", as: "jobs"
   		get "/applications/new", to: "apps#new", as: "applications" 
      post "/applications", to: "apps#create"
      get "/applications/index", to: "student#apps"
      get "/jobs/city/:search", to: "student#search", as:"search"
   end

   resources :company do
    resources :jobs
    get "/applications", to: "company#apps", as: "applications"
    get "/applications/edit", to: "apps#edit"
    patch "/applications", to: "apps#update"
  end
end
