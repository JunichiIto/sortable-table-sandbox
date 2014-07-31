require 'rails_helper'

describe Fruit do
  it 'returns name' do
    fruit = build :fruit, name: 'Banana'
    expect(fruit.name).to eq 'Banana'
  end
end