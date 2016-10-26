class Resource < ActiveRecord::Base
  belongs_to :event
  has_many :donations
end
