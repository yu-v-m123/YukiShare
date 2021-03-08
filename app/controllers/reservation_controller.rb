class ReservationController < ApplicationController
  def index

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
    # binding.pry
  end

  def create
  end

  def show
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def reservation_params
    params.require(:reservation).permit(:id, :start, :finish, :count, :reservation_image, :reservation_name, :reservation_introduction, :sum)
  end
end
