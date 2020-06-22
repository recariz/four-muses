class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :follower_relationships, foreign_key: :followed_id, class_name: 'Following'
         has_many :followers, through: :follower_relationships, source: :follower

         has_many :followed_relationships, foreign_key: :follower_id, class_name: 'Following'
         has_many :followeds, through: :followed_relationships, source: :followed
         
       

         has_many :sender_relationships, foreign_key: :reciever_id, class_name: 'Chatroom'
         has_many :senders, through: :sender_relationships, source: :sender
       
         has_many :reciever_relationships, foreign_key: :sender_id, class_name: 'Chatroom'
         has_many :recievers, through: :reciever_relationships, source: :reciever

         has_many :messages
         has_many :contests
         has_many :contest_applications

         def follow(user_id)
          followed_relationships.create(followed_id: user_id)
        end
      
        def unfollow(user_id)
          followed_relationships.find_by(followed_id: user_id).destroy
        end
      
        def is_following?(user_id)
          relationship = Following.find_by(follower_id: id, followed_id: user_id)
          return true if relationship
        end

end
