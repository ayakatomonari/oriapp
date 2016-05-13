class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :comments               #commentsテーブルとのアソシエーション

  has_many :likes, dependent: :destroy

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  mount_uploader :image, ImageUploader

  acts_as_taggable_on :labels # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス


  acts_as_ordered_taggable_on :tweet_tags

end