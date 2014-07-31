require 'rails_helper'

describe Fruit do
  it 'returns name' do
    fruit = Fruit.new(name: 'Apple')
    expect(fruit.name).to eq 'Apple'
  end
end