class CreateAdmins < ActiveRecord::Migration
  def up
    create_table :admins do |t|
      t.string :admin_name
      t.string :username
      t.string :password_digest
      t.timestamps
    end

   def down
   	drop_table :admins
   end
  end
end
