require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it 'requires a name' do
    teacher = Teacher.new(name: '')
    teacher.valid?
    expect(teacher.errors[:name].any?).to eq(true)
  end
  it 'requires an email' do
    teacher = Teacher.new(email: '')
    teacher.valid?
    expect(teacher.errors[:email].any?).to eq(true)
  end
  it 'accepts properly formatted email' do
    emails = ['tim@lo.com', 'timothy.lo@email.com']
    emails.each do |email|
      teacher = Teacher.new(email: email)
      teacher.valid?
      expect(teacher.errors[:email].any?).to eq(false)
    end
  end
  it 'rejects improperly formatted email' do
    emails = %w[@ user@ @example.com]
    emails.each do |email|
      teacher = Teacher.new(email: email)
      teacher.valid?
      expect(teacher.errors[:email].any?).to eq(true)
    end
  end
  it 'requires a unique, case insensitive email address' do
    teacher1 = Teacher.create(name:'tim', email: 'tim@lo.com', password: 'password', password_confirmation: 'password')
    teacher2 = Teacher.new(email: teacher1.email.upcase)
    teacher2.valid?
    expect(teacher2.errors[:email].first).to eq("has already been taken")
  end
  it 'requires a password' do
    teacher = Teacher.new(password: '')
    teacher.valid?
    expect(teacher.errors[:password].any?).to eq(true)
  end
  it 'requires the password to match the password confirmation' do
    teacher = Teacher.new(password: 'password', password_confirmation: 'not password')
    teacher.valid?
    expect(teacher.errors[:password_confirmation].first).to eq("doesn't match Password")
  end
  it 'automatically encrypts the password into the password_digest attribute' do
    teacher = Teacher.create(name:'tim', email: 'tim@lo.com', password: 'password', password_confirmation: 'password')
    expect(teacher.password_digest.present?).to eq(true)
  end
end