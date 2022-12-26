class Public::SearchsController < ApplicationController

  def search
    @content = params[:content]
    @genre_id = params[:genre_id]
    @genres = Genre.all
    @check = params[:check]

    if @content.present?
      unless @genre_id.present?
        if @check
          flash[:select_alert] = "※ジャンルを選択してください"
          redirect_to request.referer
        else
          items_search_name = Item.where("name LIKE ?", "%#{params[:content]}%")
          items_search_description = Item.where("description LIKE ?", "%#{params[:content]}%")
          array = []
          array = items_search_description + items_search_name
          @items = array.uniq
        end
      else
        items_search_name = Item.where("name LIKE ?", "%#{params[:content]}%")
        items_search_description = Item.where("description LIKE ?", "%#{params[:content]}%")
        items_name = items_search_name.where(genre_id: @genre_id)
        items_description = items_search_description.where(genre_id: @genre_id)
        array = []
        array = items_name + items_description
        @items_genre_search = array.uniq
        @genre = Genre.find_by(id: @genre_id)
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end
end