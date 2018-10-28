module ClassMethods
  def sync_from_trovit(attributes)
    sync('trovit', attributes)
  end

  def sync(provider, attributes)
    property = Property.new AttributeMapper.map(provider, attributes)

    Property.import [property], validate: false, on_duplicate_key_update: {
      conflict_target: [:external_id],
      columns: AttributeMapper::PROPERTY_ATTRIBUTES.keys
    }
  end
end
