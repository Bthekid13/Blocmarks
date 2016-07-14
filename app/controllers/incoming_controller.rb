class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    mail_user = params[:sender]
    @user = User.find_by email: mail_user
    unless @user
      @user = User.new(
        first_name: mail_user,
        last_name: mail_user,
        email: mail_user,
        password: 'password'
      )
      @user.save!
    end


    mail_topic = params[:subject]
    @topic = Topic.find_by title: mail_topic

    unless @topic
      @topic = Topic.new(
        title: mail_topic,
        user: @user
      )
      @topic.save!
    end


    mail_url = params["body-plain"]

    @bookmark = Bookmark.new
    @bookmark.topic = @topic
    @bookmark.user = @user
    @bookmark.url = mail_url

    @bookmark.save


    head 200
  end

end
