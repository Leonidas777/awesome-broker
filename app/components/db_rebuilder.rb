class DBRebuilder
  extend ClassMethods

  def self.run(*args)
    new(*args).run
  end

  def initialize(source: nil, provider: nil)
    @source = source
    @provider = provider
  end

  def run
    ReaderParser.run(source: @source, provider: @provider, node_handler: ->(node, provider) { NodeHandler.new(node, provider).process })
  end
end

class NodeHandler < Struct.new(:node, :provider)
  def process
    attributes = node.elements.map { |element| [element.name.to_sym, element.text.presence] }.to_h

    case provider
    when 'trovit' then DBRebuilder::sync_from_trovit(attributes)
    else raise 'Provider is not supported.'
    end
  end
end
