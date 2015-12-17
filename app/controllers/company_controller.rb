class CompanyController < ApplicationController
	include CompanyHelper
	before_action :authenticate_company!
	def show
		@company = Company.find(current_company.id)
		render "show"
	end

	def edit
	    if company_signed_in?
	      company_signed_in=true
	    else
	      company_signed_in=false
	    end
	    id = params[:id]
	    @company = Company.find(id)
  end

  def update
    id = params[:id]
    company = Company.find(id)

    updated_attributes = params.require(:company).permit(:name, :description, :avatar, :brief, :product, :website, :funding, )
    company.update_attributes(updated_attributes)
    redirect_to company
  end

  def apps
  	jobs = Job.where(company_id: current_company.id)
  	@jobapps = findapps jobs
  	render "apps"
  end

end
