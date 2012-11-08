#source file
class Queen
	attr_accessor :board,:left_slash,:right_slash
	def initialize(n)
		@n = n

		@board = []

		@left_slash  = [] # /方向
		@right_slash = [] #\方向

	end
	def try
		for y in (0..@n-1)
			put_able(y)
		end
	end
	#y座標=yのときにQをおけるかチェック
	def put_able(y,x=0)
		x = 0
		while !put_able_check?(x,y) && (x < @n)
			x += 1
		end
		if x < @n then
			#Qを置ける場所が見つかった！
			put(x,y)
			put_able(y+1)
		else
			#Qを置ける場所が見つからなかった
			x = remove
			put_able(y,x)
		end
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
		@left_slash  << (x+y)
		@right_slash << (x-y)
	end
	def remove
		@left_slash.pop
		@right_slash.pop
		x = @board.pop
		x
	end

end
