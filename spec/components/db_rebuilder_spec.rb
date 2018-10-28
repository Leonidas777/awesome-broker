require 'rails_helper'

RSpec.describe DBRebuilder do
  subject { DBRebuilder.run(source: "#{RSPEC_ROOT}/fixtures/trovit_feed.xml", provider: 'trovit') }

  context 'when a property is updated from the feed' do
    before { @property = create :property, external_id: '1483s', property_type: 'Departamento' }

    it 'updates the property type and creates two more properties' do
      subject

      expect(@property.reload.property_type).to eq 'Casa'
      expect(@property.published).to be true
      expect(Property.count).to eq 3
    end
  end

  context 'when a property is deleted out of the feed' do
    before { @property = create :property, external_id: 'irrelevant_id' }

    it 'unpublishes the irrelevant property' do
      subject

      expect(@property.reload.published).to be false
      expect(Property.count).to eq 4
    end
  end
end
