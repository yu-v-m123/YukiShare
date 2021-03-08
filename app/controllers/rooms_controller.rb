class RoomsController < ApplicationController 
  def top
  end

  def index
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to "/top"
      flash[:notice] = "ルームを登録しました"
    else
      render "new"
    end
  end

  def show
  end
  
  def edit
    @room = Room.find(params[:id])
    @user = User.find(params[:id])
  end
  
  def update
  end

  def destroy
  end
end

private

def room_params
  params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image)
end
