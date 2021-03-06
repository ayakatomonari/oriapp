class TweetsController < ApplicationController

  before_action :move_to_index, :except => [:index]

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
      tweet = Tweet.new(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id, title: tweet_params[:title])
      # binding.pry
      tweet.label_list.add((params[:tweet][:label_list]).split(","))
      tweet.save
      redirect_to :root

    end

    def destroy
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.destroy
      end
      redirect_to :root
    end

    def edit
      @tweet = Tweet.find(params[:id])
    end

    def update
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.update(tweet_params)
      end
      tweet.label_list.clear 
      tweet.label_list.add((params[:tweet][:label_list]).split(","))
      tweet.save
      redirect_to action: 'show'
    end

    def show
      @tweet = Tweet.find(params[:id])
      @comments = @tweet.comments.includes(:user)
      @like = Like.find_by(user_id: current_user.id, tweet_id: params[:id])
      @tweets =Tweet.all
    end

    def tag

      @tweets = Tweet.tagged_with(params[:name]).order("created_at DESC")
      @tag = params[:name]
    end

  private
  def tweet_params
      params.require(:tweet).permit(:image, :text, :title, :comic_number, :tag_list, :label_list, :tag)

    end

    def move_to_index
      redirect_to :action => "index" unless user_signed_in?
    end

# def tag_list
#   self.tags.map(&:name).join(', ')
# end


  end

