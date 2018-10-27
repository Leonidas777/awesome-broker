class PropertiesController < ApplicationController
  layout 'main'

  def index
    @properties = Property.published.limit(20)
  end
end
