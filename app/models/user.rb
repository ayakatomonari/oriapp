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
  
  #  devise :database_authenticatable, :registerable,
  #         :recoverable, :rememberable, :trackable, :validatable,
  #         :omniauthable, omniauth_providers: [:twitter]

  # validates :username, presence: true, uniqueness: true

devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :omniauthable
       
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end



end