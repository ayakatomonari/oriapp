class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")


# likeするよう
        # @tweet = Tweet.find(params[:id])
        # @comments = @tweet.comments.includes(:user)
        # @like = Like.find_by(user_id: current_user.id, tweet_id: params[:id])


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


  def showcomm
    user = User.find(params[:id])
    # num = 1
    # while num < Tweet.all.length
    @nickname = user.nickname
    @comments = user.comments.page(params[:page]).per(5).order("created_at DESC")
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")

  end


  def edit
  end

  def update
    current_user.update(update_params)
  end


   def facebook
    callback_from :facebook
  end

  def twitter
    callback_from :twitter
  end

  private

  def callback_from(provider)
    provider = provider.to_s

    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  

    private
  def update_params
    params.require(:user).permit(:image)
  end


  end


