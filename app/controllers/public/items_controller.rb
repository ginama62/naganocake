class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.where(is_active: true)
    @genres = Genre.all
  end

  def genre_index
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @genre_items = @genre.items.where(is_active: true)
    @items = @genre.items.where(is_active: true)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id)
  end
end
