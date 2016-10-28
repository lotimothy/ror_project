require 'rails_helper'

RSpec.describe 'teacher logging in' do
  before do
    @teacher = create_teacher
  end
  it 'prompts for email and password' do
    visit '/'
    expect(page).to have_field('email')
    expect(page).to have_field('password')
  end
  it 'logs in teacher if email/password combination is valid' do
    log_in @teacher
    expect(current_path).to eq("/events/index")
  end
  it 'does not sign in teacher if email/password combination is invalid' do
    log_in @teacher, 'wrong password'
    expect(page).to have_text('Invalid')
  end
end
