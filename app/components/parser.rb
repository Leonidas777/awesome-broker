class NodeHandler < Struct.new(:node)
  def process
    # Node processing logic
  end
end

Nokogiri::XML::Reader(File.open('./test/fixtures/example.xml')).each do |node|
  if node.name == 'Node' && node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
    NodeHandler.new(
        Nokogiri::XML(node.outer_xml).at('./Node')
    ).process
  end
end