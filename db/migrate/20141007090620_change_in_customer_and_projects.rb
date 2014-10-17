class ChangeInCustomerAndProjects < ActiveRecord::Migration
  def up
  	remove_column :customers, :application
  	change_column :projects, :project_started, 			:datetime
  	change_column :projects,  :project_estimated_to_end, 	:datetime
  end
end
