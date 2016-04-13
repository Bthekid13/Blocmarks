class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

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
    authorize @bookmark
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
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Bookmark Created"
      redirect_to [@topic, @bookmark]
     else
      flash.now[:alert] = "There was an error. Please try again."
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Bookmark Deleted"
      redirect_to request.referrer
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :edit
    end
  end
end
