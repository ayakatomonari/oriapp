class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets
  has_many :comments               #commentsテーブルとのアソシエーション
  has_many :likes
  # has_many :posts



validates :nickname, presence: true, length: { maximum: 10 }

serialize :give_comment
serialize :give_like

mount_uploader :image, ImageUploader


  # acts_as_taggable_on :labels # post.label_list が追加される
  # acts_as_taggable            # acts_as_taggable_on :tags のエイリアス

  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  validates :username, presence: true, uniqueness: true

  

end