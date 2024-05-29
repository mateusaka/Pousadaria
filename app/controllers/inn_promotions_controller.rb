class InnPromotionsController < ApplicationController

  def index
  end

  def new
    @promotion = Promotion.new

  end
end
