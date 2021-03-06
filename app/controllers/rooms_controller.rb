# @author Tom Cox <https://github.com/koxzi95>
class RoomsController < ApplicationController
  # @see def resource_not_found
  around_filter :resource_not_found
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  # This is the CanCan helper for auth.
  # The skip is so users can view the rooms but nothing else.
  load_and_authorize_resource
  skip_authorize_resource :only => :show

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
    #Single auth
    #authorize! :new, @room
  end

  def edit
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_url, notice: 'Room was successfully destroyed.'
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  # If resource not found redirect to root and flash error.
  def resource_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, :notice => "Room not found."
  end

  def room_params
    params.require(:room).permit(:name, :description, :size, :capacity, :price, :picture, :rmcat_id)
  end
end
