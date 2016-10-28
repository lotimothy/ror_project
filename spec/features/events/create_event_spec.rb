require 'rails_helper'
RSpec.describe 'creating an event' do
  it 'creates a new event and redirects to dashboard page' do
    teacher = create_teacher
    log_in teacher
    fill_in 'event[name]', with: 'New Event'
    fill_in 'event[date]', with: '11/11/2016'
    click_button 'Add Event'
    expect(current_path).to eq("/events/index")
    expect(page).to have_text('New Event')
  end
end
