require 'rails_helper'

describe Video do
  it 'has a valid factory' do
    expect(build(:video)).to be_valid
  end

  let(:factory_instance) { build(:video) }

  describe 'validations' do
    specify { expect(factory_instance).to validate_presence_of(:title) }
    specify { expect(factory_instance).to validate_presence_of(:category) }
    specify { expect(factory_instance).to validate_presence_of(:location) }
  end
end
