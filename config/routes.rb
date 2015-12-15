Rails.application.routes.draw do
  
  devise_for :companies, controllers: {company: "company" }
  devise_for :students, controllers: { student: "student" }
  
  root 'welcome#index'


   resources :student do
   		get 'student/jobs', to: "student#jobs", as: "jobs"
   end

   resources :company do
    resources :jobs
  end
end
