class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :likes, class_name: "Like", foreign_key: :liker_id

	has_many :friendships
	has_many :friends, through: :friendships
	has_many :inverse_friendships, class_name: "Friendship", foreign_key: :friend_id
	has_many :inverse_friends, through: :inverse_friendships, source: :user

	has_many :friend_requests
	has_many :requested_friendships, class_name: "FriendRequest", foreign_key: :friend_id

	# has_many :friendships, foreign_key: :requester_id
	# has_many :friends_users, through: :friends, source:

	#VALIDATIONS
	validates_uniqueness_of :email
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
	validates_presence_of :email, :name

	#bcrypt stuff
	has_secure_password

	def self.search(search)
	  if search
	    where 'lower(name) LIKE ?', "%#{search.downcase}%"
	  else
	    all
	  end
	end

	# def banned?
	# 	if current_user.banned_timestamp > Time.now
	# 		true
	# 	else
	# 		current_user.update(banned_timestamp: nil)
	# 		false
	# 	end
	# end

	# def time_ban
	# 	if current_user.score == -5
	# 		current_user.update(banned_timestamps: = Time.now + 3*60*60)
	# 	else

	# 	end
	# end
end
