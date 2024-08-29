class CreateStakeholders < ActiveRecord::Migration[7.2]
  def change
    create_table :stakeholders do |t|
      t.string :name
      t.string :role
      t.string :category
      t.string :subcategory

      t.timestamps
    end
  end
end
