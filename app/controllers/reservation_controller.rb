class ReservationController < ApplicationController
  def index

  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
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
    params.require(:reservation).permit(:start, :finish, :count)
  end
end
