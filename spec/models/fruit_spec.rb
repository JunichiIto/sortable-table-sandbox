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
    it 'changes order' do
      expect{
        orange.update_attribute :row_order_position, :first
      }.to change{
        Fruit.rank(:row_order).to_a
      }.from([apple, banana, orange]).to([orange, apple, banana])
    end
  end
end