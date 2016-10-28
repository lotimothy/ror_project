require 'rails_helper'

RSpec.describe Parent, type: :model do
  it 'requires a name' do
    parent = Parent.new(name: '')
    parent.valid?
    expect(parent.errors[:name].any?).to eq(true)
  end
  it 'requires an email' do
    parent = Parent.new(email: '')
    parent.valid?
    expect(parent.errors[:email].any?).to eq(true)
  end
  it 'accepts properly formatted email' do
    emails = ['tim@lo.com', 'timothy.lo@email.com']
    emails.each do |email|
      parent = Parent.new(email: email)
      parent.valid?
      expect(parent.errors[:email].any?).to eq(false)
    end
  end
  it 'rejects improperly formatted email' do
    emails = %w[@ user@ @example.com]
    emails.each do |email|
      parent = Parent.new(email: email)
      parent.valid?
      expect(parent.errors[:email].any?).to eq(true)
    end
  end
  it 'requires a unique, case insensitive email address' do
    parent1 = Parent.create(name:'tim', email: 'tim@lo.com', password: 'password', password_confirmation: 'password')
    parent2 = Parent.new(email: parent1.email.upcase)
    parent2.valid?
    expect(parent2.errors[:email].first).to eq("has already been taken")
  end
  it 'requires a password' do
    parent = Parent.new(password: '')
    parent.valid?
    expect(parent.errors[:password].any?).to eq(true)
  end
  it 'requires the password to match the password confirmation' do
    parent = Parent.new(password: 'password', password_confirmation: 'not password')
    parent.valid?
    expect(parent.errors[:password_confirmation].first).to eq("doesn't match Password")
  end
  it 'automatically encrypts the password into the password_digest attribute' do
    parent = Parent.create(name:'tim', email: 'tim@lo.com', password: 'password', password_confirmation: 'password')
    expect(parent.password_digest.present?).to eq(true)
  end
end