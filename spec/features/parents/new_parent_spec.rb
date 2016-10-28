require 'rails_helper'
RSpec.describe 'parent signing up' do
  it 'prompts for valid fields' do
    visit '/'
    expect(page).to have_field('parent[name]')
    expect(page).to have_field('parent[email]')
    expect(page).to have_field('parent[password]')
    expect(page).to have_field('parent[password_confirmation]')
  end
end