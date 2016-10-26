class Parent < ActiveRecord::Base
  has_secure_password
  has_many :donations

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true,  on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX },  on: :create
  validates :password, length: { minimum: 4 },  on: :create
  validates :password_confirmation, presence: true ,  on: :create

end
