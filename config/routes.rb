Rails.application.routes.draw do
  
  devise_for :students, controllers: { student: "student" }
  
  root 'welcome#index'

  

   resources :student
end
