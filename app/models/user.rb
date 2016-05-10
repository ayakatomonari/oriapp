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

end