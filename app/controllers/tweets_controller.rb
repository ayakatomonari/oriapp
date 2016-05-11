class TweetsController < ApplicationController

  before_action :move_to_index, :except => [:index]


  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")


  end

  def new
    @tweets = Tweet.new
  end

  def create
      # binding.pry
      Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id, title: tweet_params[:title])
    end

    def destroy
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.destroy
      end
    end

    def edit
      @tweet = Tweet.find(params[:id])
    end

    def update
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.update(tweet_params)
      end
    end

    def show
      @tweet = Tweet.find(params[:id])
      @comments = @tweet.comments.includes(:user)
      @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])


    end




  private
  def tweet_params
      # params.permit(:text, :imege)
      params.require(:tweet).permit(:image, :text, :title, :comic_number) 
      # params.require(:tweet).permit(:image)
      # params.permit(:text)

    end

    def move_to_index
      redirect_to :action => "index" unless user_signed_in?
    end




  end

