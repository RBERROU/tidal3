class CreateChallenges < ActiveRecord::Migration[7.2]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :subcategory

      t.timestamps
    end
  end
end
