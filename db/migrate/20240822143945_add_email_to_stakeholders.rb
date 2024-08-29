class AddEmailToStakeholders < ActiveRecord::Migration[7.2]
  def change
    add_column :stakeholders, :email, :string
  end
end
