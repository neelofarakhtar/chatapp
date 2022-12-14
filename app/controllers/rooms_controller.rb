class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @room = Room.new
    @users = User.all_except(@current_user)
    render 'index'
  end

  def create
  @room = Room.create(name: params["room"]["name"])
  end

  def show
  @current_user = current_user
  @single_room = Room.find(params[:id])
  @room = Room.new
  @rooms = Room.public_rooms
  @message = Message.new
  @messages = @single_room.messages.order(created_at: :asc)
  
  @users = User.all_except(@current_user)
  render "index"
  end

end
