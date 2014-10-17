class Project < ActiveRecord::Base
	belongs_to :customer

	validates :project_name, :presence => true,
							 :length => {:maximum => 50 }
	validates :project_description, :presence => true,
								   :length => { :maximum => 100 }
	validates :project_started, :presence => true
	validates :project_estimated_to_end, :presence => true
	validates :project_status, :presence => true 


	def project_name_search
		customer.try(:name)
	end

	def project_name_search=(name)
		self.customer = Customer.find_or_create_by_name(name) if name.present?
	end
end
