class InnPromotionsController < ApplicationController

  def index
  end

  def new
    @promotion = Promotion.new
    @inn_rooms = InnRoom.where('inn_rooms.id = ?', current_inn_owner.inn.id)
  end

  def create
    @promotion = Promotion.new(params.require(:promotion).permit(
      :name,
      :start_date,
      :end_date,
      :discount,
      :inn_room_id
    ))
  end
end
