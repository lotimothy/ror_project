require 'rails_helper'
RSpec.describe 'creating a parent' do
  before do
    visit '/'
  end
  it 'creates new parent and redirects to dashboard with proper credentials' do
    fill_in 'parent[name]', with: 'tim'
    fill_in 'parent[email]', with: 'tim@lo.com'
    fill_in 'parent[password]', with:  'password'
    fill_in 'parent[password_confirmation]', with: 'password'
    click_button 'parent_register'
    last_parent = Parent.last
    expect(current_path).to eq("/events/index")
  end
  it 'shows validation errors without proper credentials' do
    click_button 'parent_register'
    expect(current_path).to eq('/')
    expect(page).to have_text("can't be blank")
    expect(page).to have_text("invalid")
  end
end