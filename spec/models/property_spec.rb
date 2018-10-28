require 'rails_helper'

describe Property, type: :model do
  describe 'validations' do
    describe 'name' do
      it { should validate_presence_of(:name) }

      context 'uniqueness' do
        before { create :property }
        it { should validate_uniqueness_of(:external_id) }
      end
    end
  end
end
