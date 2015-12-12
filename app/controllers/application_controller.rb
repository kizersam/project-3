class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
  	case resource.class
  	when Student
  		student_path(resource)
  	when Company
  		company_path(resource)
    end
  end
end
