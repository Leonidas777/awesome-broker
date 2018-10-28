module ClassMethods
  def sync_from_trovit(attributes)
    sync('trovit', attributes)
  end

  private

  def sync(provider, attributes)
    property = Property.new(AttributeMapper.map(provider, attributes)
                                           .merge(synchronized_at: DateTime.now, published: true))

    Property.import [property], validate: false, on_duplicate_key_update: {
      conflict_target: [:external_id],
      columns: AttributeMapper::PROPERTY_ATTRIBUTES.keys + [:synchronized_at, :published]
    }
  end
end
