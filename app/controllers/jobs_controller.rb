class JobsController < ApplicationController
	before_action :authenticate_company!
	def index
		@company = current_company
		@jobs = Job.where(company_id: @company.id)
		render "index"
	end
	def new
		@company = current_company
		@jobs = Job.new
		render :new
	end

	def create
		job_params = params.require(:job).permit(:role, :compensation, :description, :location, :college, :company_id)
		@jobs = Job.create(job_params)
		@company = current_company
		if @jobs.save
			redirect_to "/company/#{@company.id}/jobs"
		else
			# redirect_to "/users/#{@user.id}/posts"
			redirect_to new_company_job, alert: @jobs.errors.full_messages 
		end
	end

	def destroy
	    @company = current_company
	    id = params[:id]
	    job = Job.find(id)
	    job.destroy
	    redirect_to (:back)
  	end

  	def edit
	    id = params[:id]
	    @jobs = Job.find(id)
  	end

  	def update
	    @company = current_company
	    id = params[:id]
	    job = Job.find(id)

	    updated_attributes = params.require(:job).permit(:compensation, :description, :location, :college)
	    job.update_attributes(updated_attributes)
	    redirect_to (:back)
  	end

end
