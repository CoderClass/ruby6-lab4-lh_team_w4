class RoomsController < ApplicationController
  

  def create
    @room = Room.new room_params
    if @room.save
      flash[:success] = "Create #{@room.name} successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def room_params
      params.require(:room).permit(:name)
    end
end
