class DropActiveStorageTablesAndPoliciesDocuments < ActiveRecord::Migration[7.2]
  def change
    drop_table :active_storage_attachments
    drop_table :active_storage_blobs
    drop_table :active_storage_variant_records
    drop_table :policy_documents
  end
end
