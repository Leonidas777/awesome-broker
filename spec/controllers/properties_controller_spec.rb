require 'rails_helper'

describe PropertiesController do
  describe '#index' do
    before do
      @published_property = create :property
      @another_published_property = create :property

      create :property, published: false
    end

    it 'renders the published properties' do
      get :index

      expect(assigns(:properties)).to eq([@published_property, @another_published_property])
      expect(response).to render_template(:index)
    end
  end
end
