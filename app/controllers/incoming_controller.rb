class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here.
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])
    @url = params["body-plain"]

    if @user.nil?
       @user = User.new
       @user.email = params[:sender]
       @user.password = 'helloworld'
       @user.save!
     end

    if @topic.nil?
      @topic = Topic.new
      @topic.user_id = @user.id
      @topic.title = params[:subject]
      @topic.save!
    end

    @bookmark = Bookmark.new
    @bookmark.topic_id = @topic.id
    @bookmark.url = @url.strip
    @bookmark.save!
    
    # Assuming all went well.
    head 200
  end
end
