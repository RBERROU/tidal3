class CreatePolicyDocuments < ActiveRecord::Migration[7.2]
  def change
    create_table :policy_documents do |t|
      t.string :title

      t.timestamps
    end
  end
end
