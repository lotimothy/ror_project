class Donation < ActiveRecord::Base
  belongs_to :resource
  belongs_to :parent
end
