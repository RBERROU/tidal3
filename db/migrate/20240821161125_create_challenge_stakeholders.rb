class CreateChallengeStakeholders < ActiveRecord::Migration[7.2]
  def change
    create_table :challenge_stakeholders do |t|
      t.references :challenge, null: false, foreign_key: true
      t.references :stakeholder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
