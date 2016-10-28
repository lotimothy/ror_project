require 'rails_helper'
RSpec.describe 'teacher logging out' do
  before do
    @teacher = create_teacher
    log_in @teacher
  end
  it 'displays "Logout" link when teacher is logged on' do
    expect(page).to have_link('Logout')
  end
  it 'logs out teacher and redirects to home page' do
    click_link 'Logout'
    expect(current_path).to eq('/')
  end
end
