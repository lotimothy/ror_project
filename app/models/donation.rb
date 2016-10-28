class Donation < ActiveRecord::Base
  belongs_to :resource, dependent: :destroy
  belongs_to :parent, dependent: :destroy
end
