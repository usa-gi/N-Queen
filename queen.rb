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
	#y座標=nのときにQをおけるかチェック
	def put_able(n)

	end
	#一手めを(x,0におけるかチェックし、置く)
	def put_first(x)
		put(x,0)
	end
	#座標（x,y）にQがおけるかどうかを判定する
	def put_able_check?(x,y)
		# x軸方向にQが存在しない かつ
		# y軸方向にQが存在しない かつ
		# 左斜め方向にQが存在しない かつ
		# 右斜め方向にQが存在しない
		if @board[y] == nil \
		&& @board.index(x) == nil \
		&& @left_slash.index(x+y) == nil \
		&& @right_slash.index(x-y) == nil then 
			return true
		end
		false
	end
	def put(x,y)
		@board[y] = x
	end
end
