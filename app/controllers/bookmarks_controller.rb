class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(
      list_id: params[:list_id],
      comment: params[:bookmark][:comment],
      movie_id: params[:bookmark][:movie_id]
    )
    if @bookmark.save
      redirect_to list_path(@bookmark.list_id)
    else
      render 'lists/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id)
  end

  private

  def list_params
    params.require(:list).permit(:comment)
  end
end
