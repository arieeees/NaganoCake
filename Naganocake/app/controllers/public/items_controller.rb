class Public::ItemsController < ApplicationController
  
  def index
    @genres = Genre.all
    @all_items = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def search
      @all_items = Item.where(genre_id: params[:genre_id])
      if params[:genre_id].present?
        redirect_to admin_genre_path(params[:genre_id])
      else
        redirect_to items_path
      end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
