class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	has_many :likes
	has_many :likers, through: :likes, source: :liker
	

	#VALIDATIONS
	validates_presence_of :post_id, :user_id, :content
end
