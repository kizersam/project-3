module StudentHelper




	def get_companies_by_location jobs
	    companies = []
	    names = []
	    jobs.each do |job|
		    company = Company.find(job.company_id)
		    company_hash = Hash.new
		    company_hash["jobs"] ||= []
		    # companies.select do |hash| 
		      unless names.include?(company.name) 
		      	names << company.name
		        company_hash["name"] = company.name
		        company_hash["brief"] = company.brief
		        company_hash["avatar"] = company.avatar.url(:thumb)
		        companies << company_hash
		      end
		      indx= names.index(company.name)
		      companies[indx]["jobs"]<<job      
	    end
	    companies
	end
end





 
