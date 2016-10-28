require 'rails_helper'
RSpec.describe 'parent logging out' do
  before do
    @parent = create_parent
    log_in @parent
  end
  it 'displays "Logout" link when parent is logged on' do
    expect(page).to have_link('Logout')
  end
  it 'logs out parent and redirects to home page' do
    click_link 'Logout'
    expect(current_path).to eq('/')
  end
end
