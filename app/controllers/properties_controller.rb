class PropertiesController < ApplicationController
  layout 'main'

  def index
    @properties = Property.published.page(params[:page]).per(10)
  end
end
