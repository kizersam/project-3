class AppsController < ApplicationController
	before_action :authenticate_student!

	def new
		@student = current_student
		@jobs = Job.find(params[:job_id])
		@apps = Application.new
		render :jobs
	end

	def create
		apps_params = params.require(:application).permit(:body, :student_id, :job_id)
		@apps = Application.create(apps_params)
		@student = current_student
		if @apps.save
			redirect_to (:back)
			flash[:notice] = "Application Submitted Succesfully!"
		else
			# redirect_to "/users/#{@user.id}/posts"
			redirect_to student_jobs, alert: @apps.errors.full_messages 
		end
	end
end
