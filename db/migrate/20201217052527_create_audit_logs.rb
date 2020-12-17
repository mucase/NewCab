class CreateAuditLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :audit_logs do |t|
      t.string :entity_type
      t.integer :entity_id
      t.string :event

      t.timestamps
    end
  end
end
