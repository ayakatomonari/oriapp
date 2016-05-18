# class LikesController < ApplicationController
#   def create
#     @like = Like.create(user_id: current_user.id, teewt_id: params[:tweet_id])
#     @likes = Like.where(teewt_id: params[:tweet_id])
#   end

#   def destroy
#     @like = current_user.likes.find_by(tweet_id: params[:tweet_id])
#     @like.destroy
#     @likes = Like.where(tweet_id: params[:tweet_id])
#   end

# end

class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @likes = Like.where(tweet_id: params[:tweet_id])
    @tweet = Tweet.find(params[:tweet_id])
  end



  def destroy
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    like.destroy
    @likes = Like.where(tweet_id: params[:tweet_id])
    @tweet = Tweet.find(params[:tweet_id])
  end



  # def show
  #   user = User.find(params[:id])
  #   @nickname = user.nickname
  #   @tweets = []

  #   user.likes.each do |like|
  #     if like.tweet_id?
  #       @tweets << like.tweet
  #     end
  #   end

  # end



end
