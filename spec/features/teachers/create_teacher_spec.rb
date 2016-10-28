require 'rails_helper'
RSpec.describe 'creating a teacher' do
  before do
    visit '/'
  end
  it 'creates new teacher and redirects to dashboard with proper credentials' do
    fill_in 'teacher[name]', with: 'tim'
    fill_in 'teacher[email]', with: 'tim@lo.com'
    fill_in 'teacher[password]', with:  'password'
    fill_in 'teacher[password_confirmation]', with: 'password'
    click_button 'teacher_register'
    last_teacher = Teacher.last
    expect(current_path).to eq("/events/index")
  end
  it 'shows validation errors without proper credentials' do
    click_button 'teacher_register'
    expect(current_path).to eq('/')
    expect(page).to have_text("can't be blank")
    expect(page).to have_text("invalid")
  end
end