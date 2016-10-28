require 'rails_helper'

RSpec.describe 'parent logging in' do
  before do
    @parent = create_parent
  end
  it 'prompts for email and password' do
    visit '/'
    expect(page).to have_field('email')
    expect(page).to have_field('password')
  end
  it 'logs in parent if email/password combination is valid' do
    log_in @parent
    expect(current_path).to eq("/events/index")
  end
  it 'does not sign in parent if email/password combination is invalid' do
    log_in @parent, 'wrong password'
    expect(page).to have_text('Invalid')
  end
end
