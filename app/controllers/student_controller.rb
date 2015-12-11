class StudentController < ApplicationController
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

end
