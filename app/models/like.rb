class Like < ActiveRecord::Base
	belongs_to :liker, class_name: "User"
	belongs_to :post
	belongs_to :comment

	#VALIDATIONS
	validates_presence_of :liker_id, :value

  def to_boolean(str)
      str == 'true'
  end
end
