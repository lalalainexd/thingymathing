require 'rails_helper'

feature 'ToDo', js: true do
  it 'can be CRUDed' do
    Todo.create!(task: 'Eat')

    visit '/'

    fill_in 'Task...', with: ''
    click_on 'Add'

    expect(page).to have_content("Task can't be blank")

    fill_in 'Task...', with: 'Bye Bunnies >)'
    click_on 'Add'

    expect(page).to_not have_content("Task can't be blank")

    within '.todos' do
      expect(page).to have_content 'Bye Bunnies >)'
      expect(all('li').length()).to eq 2
    end

    expect(page).to have_field 'Task...', with: ''

    within('li', text: 'Bye Bunnies') do
      click_on 'Done'
    end

    expect(find('li.completed')).to have_content('Bye Bunnies')


  end
end

