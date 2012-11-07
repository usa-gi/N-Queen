#source file
class Queen
	attr_accessor :board
	def initialize(n)
		@n = n
		@board = Array.new(n)
		@board.pop # = []

	end
	def try
		for y in (0..@n-1)
			put_able(y)
		end
	end
	def put_first(x)
		put_able_check?(x,0)

	end
	def put_able(n)

	end
end
