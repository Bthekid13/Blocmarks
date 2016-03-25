class BookmarksController < ApplicationController

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.save
      flash[:notice] = "Bookmark updated"
      redirect_to @bookmark
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :edit
    end

  end

  def create
    @bookmark = Bookmark.new
    @bookmark.url = params[:bookmark][:url]
    @topic = Topic.find(params[:topic_id])
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Bookmark Created"
      redirect_to [@topic, @post]
     else
      flash.now[:alert] = "There was an error. Please try again."
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "Bookmark Deleted"
      render :show
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :edit
    end

  end

end
