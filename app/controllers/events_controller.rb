class EventsController < ApplicationController

  def index
    @teacherview = Event.teacher_view
    @parentview = Event.parent_view(session[:parent_id])
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      params["resource"].each do |item, count|
        if count.to_i > 0
          Resource.create(event_id: @event.id, name: item, quantity: count)
        end
      end
      params["item_name"].each do |item, count|
        if params["item_quantity"][item].to_i > 0
          @resource = Resource.create(event_id: @event.id, name: params["item_name"][item], quantity: params["item_quantity"][item])
        end
      end
      redirect_to "/events/index"
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    # @event = Event.find(params[:id])
    # @donations = Resource.select("resources.id AS id, resources.name AS name, resources.quantity AS r_quantity, donations.parent_id AS p_id, donations.quantity AS p_quantity").joins("LEFT OUTER JOIN donations ON resources.id = donations.resource_id").where("event_id = ?", @event.id).where("p_id = ? OR p_id IS NULL", session[:parent_id])
    # @teacherview = Resource.select("resources.id AS id, resources.name AS name, resources.quantity AS total, SUM(donations.quantity) AS sofar").joins("LEFT OUTER JOIN donations ON resources.id = donations.resource_id").where("event_id = ?", @event.id).group("id")
  end

  def update
    params["item"].each do |newItem, newValue|
      if res = Donation.find_by(resource_id: newItem, parent_id: session[:parent_id])
        res.update(quantity: newValue)
      else
        Donation.create(resource_id: newItem, parent_id: session[:parent_id], quantity: newValue)
      end
    end
    redirect_to :back
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to "/events/index"
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :teacher_id)
  end
end