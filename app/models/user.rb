class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :likes, class_name: "Like", foreign_key: :liker_id

	has_many :friendships
	has_many :friends, through: :friendships
	has_many :inverse_friendships, class_name: "Friendship", foreign_key: :friend_id
	has_many :inverse_friends, through: :inverse_friendships, source: :user

	# has_many :friendships, foreign_key: :requester_id
	# has_many :friends_users, through: :friends, source:

	#VALIDATIONS
	validates_uniqueness_of :email
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
	validates_presence_of :email, :name

	#bcrypt stuff
	has_secure_password
end
