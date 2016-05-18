class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
    redirect_to "/tweets/#{@comment.tweet.id}"   
  end

  # def show

  #   user = User.find(params[:id])
  #   @nickname = user.nickname


  #   # binding.pry

  #   @tweets = []
  #   user.comments.each do |comment|
  #     @tweets << comment.tweet
  #   end

  # end


  private
  def comment_params
    params.permit(:text, :tweet_id)
  end

end