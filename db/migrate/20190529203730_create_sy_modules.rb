# Create SyModules
class CreateSyModules < ActiveRecord::Migration[5.2]
  def change
    create_table :sy_modules do |t|
      t.string :name, null: false
      t.string :owner
      t.string :module_type
      t.integer :width
      t.integer :length
      t.text :description

      t.string :created_by, null: false
      t.string :updated_by, null: false
      t.timestamps
    end
  end
end
