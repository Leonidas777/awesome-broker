class PropertiesController < ApplicationController
  layout 'south'

  def index
    @properties = Property.published.page(params[:page]).per(9)
  end
end
