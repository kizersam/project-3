class StudentController < ApplicationController
	include StudentHelper
	before_action :authenticate_student!
	def show
		# @student = Student.find(params[:id])
		render "show"
	end

	def edit
	    if student_signed_in?
	      student_signed_in=true
	    else
	      student_signed_in=false
	    end
	    id = params[:id]
	    @student = Student.find(id)
  end

  def update
    id = params[:id]
    student = Student.find(id)

    updated_attributes = params.require(:student).permit(:college, :major, :location, :linkedin, :description, :first_name, :last_name)
    student.update_attributes(updated_attributes)
    redirect_to student
  end

  def jobs
  	@student = current_student
	jobs = Job.where(location: @student.location)
	@companies = get_companies_by_location jobs
	@apps = Application.new
  end

  def apps
  	genapps = Application.where(student_id: current_student.id)
	@apps = createapplications genapps
  	render "apps"
  end

end
