class Resource < ActiveRecord::Base
  belongs_to :event, dependent: :destroy
  has_many :donations
end
