#source file
class Queen
	attr_accessor :board,:left_slash,:right_slash
	def initialize(n)
		@n = n

		@board = Array.new(n)
		@board.pop # = []

		@left_slash  = [] # /方向
		@right_slash = [] #\方向

	end
	def try
		for y in (0..@n-1)
			put_able(y)
		end
	end
	def put_first(x)
		put_able_check?(x,0)

	end
	def put_able_check?(x,y)
		if @board[y] == nil \
		&& @left_slash.index(x+y) == nil then # 左斜め方向にQが存在しない
#		if @board[y] == nil then
			return true
		end
		false
	end
	def put_able(n)

	end
end
