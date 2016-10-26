class Event < ActiveRecord::Base
  belongs_to :teacher
  has_many :resources

  validates :name, :date, presence: true

end
