require 'rails_helper'

feature 'Fruit pages' do
  given!(:apple) { create :fruit, name: 'Apple' }
  given!(:banana) { create :fruit, name: 'Banana' }
  given!(:orange) { create :fruit, name: 'Orange' }
  scenario 'Sort by drag-and-drop', js: true do
    visit root_path
    expect(page).to have_content 'Listing fruits'
    expect(page).to have_content 'Apple'
    expect(page).to have_content 'Banana'
    expect(page).to have_content 'Orange'

    source = page.find("#fruit-#{apple.id}")
    target = page.find("#fruit-#{orange.id}")
    expect{
      source.drag_to(target)
      sleep 0.2
    }.to change{
      Fruit.rank(:row_order).to_a
    }.from([apple, banana, orange]).to([banana, orange, apple])
  end
end
