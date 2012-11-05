#source file
class Queen
	attr_accessor :board
	def try(n)
		@n = n
		@board = Array.new(1)
		@board.pop
	end

end
