class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :likes
	has_many :likers, through: :likes, source: :liker

	#VALIDATIONS
	validates_presence_of :user_id, :title, :text_field, :post_type
end
