Rails.application.routes.draw do
  
  devise_for :companies, controllers: {company: "company" }
  devise_for :students, controllers: { student: "student" }
  
  root 'welcome#index'

  

   resources :student, :company
end
