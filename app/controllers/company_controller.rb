class CompanyController < ApplicationController
	before_action :authenticate_company!
	def show
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

    updated_attributes = params.require(:company).permit(:name, :description)
    company.update_attributes(updated_attributes)
    redirect_to company
  end

end
