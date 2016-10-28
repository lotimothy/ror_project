RSpec.describe Event, type: :model do
  it 'requires a name' do
    event = Event.new(name: '')
    event.valid?
    expect(event.errors[:name].any?).to eq(true)
  end
  it 'requires an date' do
    event = Event.new(date: '')
    event.valid?
    expect(event.errors[:date].any?).to eq(true)
  end
end
