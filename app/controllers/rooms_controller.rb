class RoomsController < ApplicationController  
  def top
  end

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
