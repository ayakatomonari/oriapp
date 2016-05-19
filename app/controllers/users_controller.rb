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
@tweets_comments.reverse!

# like表示用
@tweets_likes = []

user.likes.each do |like|
  if like.tweet_id?
    @tweets_likes << like.tweet
  end
  @tweets_likes.reverse!
end


end

def tag

  @tweets = Tweet.tagged_with(params[:name]).order("created_at DESC")

end




def edit
end

def update
  current_user.update(update_params)
  # redirect_to :root
  redirect_to controller: 'users', action: 'show', id: params[:id]
  # @tweet.user_id
end

private
def update_params
  params.require(:user).permit(:image, :nickname, :backimage)
end


end


