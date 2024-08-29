class CreateResponses < ActiveRecord::Migration[7.2]
  def change
    create_table :responses do |t|
      t.references :stakeholder, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.integer :impact_materiality
      t.integer :financial_materiality

      t.timestamps
    end
  end
end
