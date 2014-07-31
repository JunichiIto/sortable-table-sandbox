require 'rails_helper'

describe Fruit do
  it 'returns name' do
    fruit = build :fruit, name: 'Banana'
    expect(fruit.name).to eq 'Banana'
  end
  describe 'ordering' do
    let!(:apple) { create :fruit, name: 'Apple' }
    let!(:banana) { create :fruit, name: 'Banana' }
    let!(:orange) { create :fruit, name: 'Orange' }
    it 'orders by registration' do
      expect(Fruit.rank(:row_order)).to eq [apple, banana, orange]
    end
  end
end