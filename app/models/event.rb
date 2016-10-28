class Event < ActiveRecord::Base
  belongs_to :teacher, dependent: :destroy
  has_many :resources
  has_many :donations, :through => :resources

  validates :name, :date, presence: true

  def self.teacher_view
    events = self.includes(:resources).order(:date)
    package = []
    events.each do |event|
      item = {}
      item[:event] = event
      resource_package = []
      event.resources.each do |resource|
        resource_item = {}
        resource_item[:info] = resource
        resource_item[:sum] = Donation.where(resource_id: resource.id).sum(:quantity)
        resource_package << resource_item
      end
      item[:resources] = resource_package
      package << item
    end
    package
  end

  def self.parent_view(pid)
    events = self.includes(:resources).order(:date)
    package = []
    events.each do |event|
      item = {}
      item[:event] = event
      resource_package = []
      event.resources.each do |resource|
        resource_item = {}
        resource_item[:info] = resource
        resource_item[:sum] = Donation.where(resource_id: resource.id).sum(:quantity)
        tentative = Donation.where(resource_id: resource.id).where("parent_id = ?", pid).first
        if tentative
          resource_item[:quantity] = tentative.quantity
        else
          resource_item[:quantity] = 0
        end
        resource_package << resource_item
      end
      item[:resources] = resource_package
      package << item
    end
    package
  end

end
