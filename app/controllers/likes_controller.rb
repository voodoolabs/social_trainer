class LikesController < ApplicationController
  def index
    render 'posts/index'
  end

  def new
  	render 'posts/index'
  end
  
  def create
    like = Like.create_or_update(post_id: params[:post_id], liker_id: params[:user_id], value: params[:value])
    
    @post_likes = like.post.likes

    up = @post_likes.where(value: 'true').count
    
    down = @post_likes.where(value: 'false').count

    total = up - down
    

    puts "="*50
    puts up
    puts "="*50

    puts "x"*50
    puts down
   	puts "x"*50
    
   	puts "o"*50
    puts total
    puts "o"*50

    render :json => total
  end

end


# class Game
	
# 	def initialize(board)
# 		@board = board
# 	end

# 	def create_cord
		
# 	end

# 	def get_row(row)
# 		@board[row]
# 	end

# 	def get_col(col)
# 		col_arr = []
# 		@board.each do |row|
# 			col_arr << row[col-1]
# 		end
# 		col_arr
# 	end

# end

# boggle_board = some_array

# coords =[ [], [], [], [], ]

# game = Game.new(boggle_board)

# game.get_coord(coords)
# game.get_row(2)



