class Admin::ItemsController < ApplicationController

    before_action :authenticate_admin!

  def index
    @items = Item.all.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品登録が完了しました"
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "アイテム編集が完了しました"
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  #投稿データのストロングパラメータ
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id)
  end

end