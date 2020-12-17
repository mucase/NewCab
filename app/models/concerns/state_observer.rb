class StateObserver < ActiveRecord::Observer
  observe Cab

  def after_save(record)
    Rails.logger.info "recording #{record.id}"
    AuditLog.create(entity_id: record.id, entity_type: "Cab", event: record.state)
  end
end
