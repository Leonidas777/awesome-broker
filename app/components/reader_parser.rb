class ReaderParser
  def self.run(*args)
    new(*args).run
  end

  def initialize(source: nil, provider: nil, node_handler: nil)
    @source = source
    @provider = provider
    @node_handler = node_handler
  end

  def run
    raise 'Target node was not defined.' unless target_node.present?

    Nokogiri::XML::Reader(File.open(@source)).each do |node|
      if node.name == target_node && node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
        current_node = Nokogiri::XML(node.outer_xml).at("./#{target_node}")
        @node_handler.call(current_node, @provider)
      end
    end
  end

  def target_node
    case @provider
    when 'trovit' then 'ad'
    end
  end
end
