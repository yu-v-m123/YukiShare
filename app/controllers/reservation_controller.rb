class ReservationController < ApplicationController
  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:room_id])
    @reservation.room_id = @room.id
    @day = (@reservation.finish-@reservation.start).to_int
    @price = @room.room_price
    @sum = (@day*@price)*@reservation.count
    @reservation.reservation_name = @room.room_name
    @reservation.reservation_image = @room.room_image
    @reservation.reservation_introduction = @room.room_introduction
    @reservation.sum = @sum
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:room_id])
    @reservation.room_id = @room.id
    # binding.pry
    if @reservation.save
      redirect_to room_reservation_path(id: @reservation.id)
      flash[:notice] = "ルームを予約しました"
    else
      render :confirm
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def reservation_params
    params.require(:reservation).permit(:start, :finish, :count, :reservation_image, :reservation_name, :reservation_introduction, :sum)
  end
end
