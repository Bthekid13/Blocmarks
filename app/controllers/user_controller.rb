class UserController < ApplicationController
  def show
    @user = current_user
    @user_bookmarks = @user.bookmarks
    @likes = @user.likes
  end
end
