class Admin::GenresController < ApplicationController

    before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンル登録が完了しました"
      redirect_to admin_genres_path
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンル名変更が完了しました"
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  #投稿データのストロングパラメータ
  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
