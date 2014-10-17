class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :team_leader

      t.timestamps
    end
  end

  def down
    drop_table :teams
  end
end
