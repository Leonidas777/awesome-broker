module AttributeMapper
  module_function

  TROVIT_MAPPING =
    {
      id: :external_id,
      url: :external_url,
      title: :name,
      content: :description,
    }

  PROPERTY_ATTRIBUTES =
    {
      external_id: nil,
      property_type: nil,
      external_url: nil,
      name: nil,
      description: nil,
      price: 0,
      floor_area: 0.0,
      rooms: 0,
      bathrooms: 0,
      city: nil,
    }

  def map(provider, attributes)
    case provider
    when 'trovit' then transform_property_from_trovit(attributes)
    else fail
    end
  end

  def transform_property_from_trovit(attributes)
    transform_property(attributes, TROVIT_MAPPING, PROPERTY_ATTRIBUTES)
  end

  def transform_property(source, mappings, slices)
    source
      .transform_keys { |key| mappings[key] || key }
      .slice(*slices.keys)
      .reverse_merge(slices)
      .each { |key, value| source[key] = (value.presence || PROPERTY_ATTRIBUTES[key]) }
  end
end
