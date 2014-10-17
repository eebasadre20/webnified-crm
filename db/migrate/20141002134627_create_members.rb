class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :member_name
      t.string :member_position

      t.timestamps
    end
  end

  def down
    drop_table :members
  end
end
