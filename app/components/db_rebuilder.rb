class DBRebuilder
  def self.run(*args)
    new(*args).run
  end

  def initialize(source: nil, provider: nil)
    @source = source
    @provider = provider
  end

  def run
    Nokogiri::XML::Reader(File.open(@source)).each do |node|
      if node.name == 'ad' && node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
        NodeHandler.new(
          Nokogiri::XML(node.outer_xml).at('./ad'), @provider
        ).process
      end
    end
  end
end

class NodeHandler < Struct.new(:node, :provider)
  TROVIT_MAPPING =
    {
      property_type: :property_type,
      id: :provider_id,
      url: :url,
      title: :name,
      content: :description,
      type: :type,
      agency: :agency,
      price: :price,
      { price: :currency } => :currency,
      floor_area: :meters,
      rooms: :rooms,
      bathrooms: :bathrooms,
      city: :city,
      city_area: :city_area,
      region: :region,
      longitude: :longitude,
      latitude: :longitude
    }

  def process
    mapping =
      case provider
      when 'trovit' then TROVIT_MAPPING
      end

    raise 'Provider is not supported' unless mapping.present?

    mapping.each do |initial_name, column_name|
      if initial_name.is_a?(Hash)
        initial_name.each do |node_name, attribute|
          property = node.at("./#{node_name}")

          puts "#{initial_name}: #{property.try(:[], attribute.to_s)}"
        end

        next
      end

      property = node.at("./#{initial_name}")

      puts "#{initial_name}: #{property.try(:inner_html)}"
    end

    puts '======================================================'
  end
end


