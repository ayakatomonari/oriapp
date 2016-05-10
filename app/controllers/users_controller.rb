class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")


# comment表示用

    @tweets_comments = []
    user.comments.each do |comment|
      @tweets_comments << comment.tweet
    end

# like表示用
    @tweets_likes = []

    user.likes.each do |like|
      if like.tweet_id?
        @tweets_likes << like.tweet
      end
end


  end


  def showcomm
    user = User.find(params[:id])
    # num = 1
    # while num < Tweet.all.length
    @nickname = user.nickname
    @comments = user.comments.page(params[:page]).per(5).order("created_at DESC")
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")

  end



  end


