# -*- encoding: utf-8 -*-
require_relative 'queen'
describe "N-Queen"	do
	describe "N = 1 のとき"	do
		before(:each) do
			@queen = Queen.new(1)
		end
		describe "初期処理のとき"	do
			it "クラス名はあっているか？" do
				@queen.class.should == Queen
			end
			it "盤の配置（Board）は初期化されているか？" do
				@queen.board.should == []
			end
		end
		describe "put_firstメソッドを呼んだとき"	do
			describe "一手目がx=0,y=0のとき"	do
				it "Qを置けるか判定するput_ableメソッドを呼び出すか？" do
					@queen.should_receive(:put_able_check?).at_least(1)
					@queen.put_first(0)
				end
				it "Qを置くputメソッドを呼び出すか？" do
					@queen.should_receive(:put).exact(1)
					@queen.put_first(0)
				end
				it "Qは（0,0）におかれるか？" do
					@queen.put_first(0)
					@queen.board.should =[0]
				end
			end
		end
		describe "put_able_check?メソッドを呼んだとき"	do
			describe "一手目のy=0,x=0で置けるか判定するとき、" do
				it "置ける（true）を返すか？" do
					@queen.put_able_check?(0,0).should be_true
				end
				it "y列にすでにQがあるとき,置けない（false）を返すか？" do
					@queen.board = [1]
					@queen.put_able_check?(0,0).should be_false
				end
			end
		end
		describe "put_ableメソッドを呼んだとき"	do
			it "put_ableメソッドは規定回数呼ばれるか？" do
				@queen.should_receive(:put_able).exactly(1)
				@queen.try
			end
		end
	end
	describe "N = 2 のとき"	do
		before(:each) do
			@queen = Queen.new(2)
		end
		describe "一手目がx=0のとき"	do
			describe "put_able_check?メソッドを呼んだとき"	do
				it "置ける（true）を返すか？" do
					@queen.put_able_check?(0,0).should be_true
				end
			end
			describe "putメソッドを呼んだとき"	do
				it "(0,0)に置くか？" do
					@queen.put(0,0)
					@queen.board.should == [0]
				end
			end
		end
		describe "一手目がx=1のとき"	do
			describe "put_able_check?メソッドを呼んだとき"	do
				it "置ける（true）を返すか？" do
					@queen.put_able_check?(1,0).should be_true
				end
			end
			describe "putメソッドを呼んだとき"	do
				it "(1,0)に置くか？" do
					@queen.put(1,0)
					@queen.board.should == [1]
				end
			end
		end
		describe "一手目がx=2のとき"	do
			describe "put_able_check?メソッドを呼んだとき"	do
				it "置ける（true）を返すか？" do
					@queen.put_able_check?(2,0).should be_true
				end
			end
			describe "putメソッドを呼んだとき"	do
				it "(0,2)に置くか？" do
					@queen.put(2,0)
					@queen.board.should == [2]
				end
			end
		end

		describe "put_able_check?メソッドを呼んだとき"	do
			describe "一手目のy=0,x=0で置けるか判定するとき、" do
				it "置ける（true）を返すか？" do
					@queen.put_able_check?(0,0).should be_true
				end
				it "y列にすでにQがあるとき,置けない（false）を返すか？" do
					@queen.board = [1]
					@queen.put_able_check?(0,0).should be_false
				end
				it "x列にすでにQがあるとき,置けない（false）を返すか？" do
					@queen.board = [1]
					@queen.put_able_check?(1,1).should be_false
				end
				it "左斜め線上（/[スラッシュ]方向）にすでにQがあるとき,置けない（false）を返すか？" do
					@queen.board = [1]
					@queen.left_slash = [1]
					@queen.put_able_check?(0,1).should be_false
				end
				it "右斜め線上（\\[バックスラッシュ]方向）にすでにQがあるとき,置けない（false）を返すか？" do
					@queen.board = [0]
					@queen.right_slash = [0]
					@queen.put_able_check?(1,1).should be_false
				end
			end
		end
	end

end
