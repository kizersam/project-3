module CompanyHelper

	def findapps jobs
		jobapps = []

		jobs.each do |j| 
			app = Application.where(job_id: j.id)
		
			jobapp_hash = {}
			jobapp_hash["apps"] ||= []
			jobapp_hash["role"] = j.role
			jobapp_hash["location"] = j.location
			
			app.each do |a|
				jobapp_hash["apps"] << a
			end
			jobapps << jobapp_hash
		end
	jobapps
	end

end
