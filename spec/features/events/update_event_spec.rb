require 'rails_helper'
RSpec.describe 'parent updating event' do
  it 'update parent quantity and redirects to dashboard' do
    teacher = create_teacher
    log_in teacher
    fill_in 'event[name]', with: 'Blah blah'
    fill_in 'event[date]', with: '11/11/2016'
    fill_in 'resource[Chaperones]', with: '10'
    fill_in 'resource[Rides]', with: '20'
    click_button 'Add Event'
    click_link 'Logout'
    parent = create_parent
    log_in parent
    expect(page).to have_text('Blah blah')
    page.all(:fillable_field, 'updating').first.set('5')
    click_button 'Update'
    expect(page).to have_text('5')
  end
end
