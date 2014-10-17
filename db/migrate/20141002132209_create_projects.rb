class CreateProjects < ActiveRecord::Migration
  def up
    create_table :projects do |t|
      t.integer "customer_id"
      t.string :project_name
      t.text :project_description
      t.date :project_started
      t.date :project_estimated_to_end
      t.string :project_status

      t.timestamps
    end
    add_index("projects", "customer_id")
  end

  def down
    drop_table :projects
  end
end
