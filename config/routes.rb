Rails.application.routes.draw do
  
  devise_for :companies, controllers: {company: "company", registrations: "companies/registrations"}
  devise_for :students, controllers: { student: "student", registrations: "students/registrations"}
  
  root 'welcome#index'


   resources :student do
   		get 'student/jobs', to: "student#jobs", as: "jobs"
   		get "student/applications/new", to: "apps#new", as: "applications" 
      post "student/applications", to: "apps#create"
      get "student/applications/index", to: "student#apps"
   end

   resources :company do
    resources :jobs
    get "company/applications", to: "company#apps", as: "applications"
    get "/applications/edit", to: "apps#edit"
    patch "company/applications", to: "apps#update"
  end
end
