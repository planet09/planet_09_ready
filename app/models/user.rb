class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,
         :omniauthable, omniauth_providers: [:facebook, :kakao]
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  #User.find_auth
  def self.find_auth(auth, signed_in_resource=nil)
    #Identity가 있는지?
    #Identity에 uid, provider정보가 일치하는 게 없으면
    #새로 생성=> user=nil
    #만약 일치한다면, uid가 있으므로, user오브젝트가 리턴된다.
    identity = Identity.find_auth(auth)
    user=signed_in_resource ? signed_in_resource : identity.user

    user= identity.user
    #user가 있는지 확인해야함
    #Identity에 등록된 유저가 있는지
    if user.nil?
      user=User.find_by(email: auth.info.email)
      if user.nil? #User에 email을 쓰고있는 유저가 있는지
        if auth.provider=='kakao'
          user=User.new(
            name: auth.info.name,
            password: Devise.friendly_token[0,20],
            profile_img: auth.info.image
          )
        else
        user=User.new(
          email: auth.info.email,
          name: auth.info.name,
          password: Devise.friendly_token[0,20],
          profile_img: auth.info.image
        )
      end
    end
  end
    user.save!
    if identity.user != user
       identity.user=user
       identity.save!
    end
    user
  end
  def email_required?
      false
  end
end
