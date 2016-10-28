require 'rails_helper'
RSpec.describe 'new event' do
  it 'provides form in teacher home page to create a new event' do
    teacher = create_teacher
    log_in teacher
    expect(page).to have_field('event[name]')
  end
end
