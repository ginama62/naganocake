class Public::HomesController < ApplicationController

  def top
    @items = Item.where(is_active: true)
    @genres = Genre.all
  end

  def about
  end

end
