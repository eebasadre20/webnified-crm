class ProjectsController < ApplicationController

	def show
		@customer_id = params[:id]
		@projects = Project.where(:customer_id => params[:id])
	end

	def new
		@customer_id = params[:id]
		@project = Project.new
	end

	def create
		customer_id = params[:customer_id]
		customer = Customer.find(customer_id)
		project =  Project.new(project_params)
		
		if customer.projects << project
			flash[:notice] = "Project successfully created!"
			redirect_to(:action => 'show', :id => customer_id)
		else
			flash[:notice] = "Oop! Something error!"
			render('new')
		end
	end

	def edit
		@project = Project.find(params[:id])
		@customer_id = params[:customer_id]
	end

	def update
		@project = Project.find(params[:id])

		if @project.update_attributes(project_params)
			flash[:notice] = "Project successfully updated!"
			redirect_to(:controller => 'projects', :action => 'show', :id => @project.id)
		else
			render('edit')
		end
	end

	def delete
		@project = Project.find(params[:id])
	end

	def destroy
		@project = Project.find(params[:id])

		if @project.destroy
			flash[:notice] = "Project successfully deleted!"
			redirect_to(:action => 'show')
		end
	end
	private

		def project_params
			params.require(:project).permit(:project_name, :project_description, :project_started, :project_estimated_to_end, :project_status)
		end
end
