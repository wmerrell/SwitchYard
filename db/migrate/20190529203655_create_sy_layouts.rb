# Create SyLayouts
class CreateSyLayouts < ActiveRecord::Migration[5.2]
  def change
    create_table :sy_layouts do |t|
      t.string :name, null: false
      t.string :owner
      t.text :description

      t.string :created_by, null: false
      t.string :updated_by, null: false
      t.timestamps
    end
  end
end
