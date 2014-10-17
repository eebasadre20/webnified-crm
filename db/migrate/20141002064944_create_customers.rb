class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :name
      t.string :company
      t.string :address
      t.string :application
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :customers
  end
end
