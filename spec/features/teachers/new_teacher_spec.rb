require 'rails_helper'
RSpec.describe 'teacher signing up' do
  it 'prompts for valid fields' do
    visit '/'
    expect(page).to have_field('teacher[name]')
    expect(page).to have_field('teacher[email]')
    expect(page).to have_field('teacher[password]')
    expect(page).to have_field('teacher[password_confirmation]')
  end
end