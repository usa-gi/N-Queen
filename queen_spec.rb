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
				it "Qを置くputメソッドを呼び出すか？" do
					@queen.should_receive(:put).exactly(1)
					@queen.put_first(0)
				end
				it "Qは（0,0）におかれるか？" do
					@queen.put_first(0)
					@queen.board.should == [0]
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
	describe "N = 4 のとき"	do
		before(:each) do
			@queen = Queen.new(4)
		end
		describe "put_ableメソッドを呼んだとき"	do
			it "1手目が正常におけるか？" do
				@queen.put_able(0)
				@queen.board.should == [0]
			end
			describe "２手目が正常におけるか？" do
				it "(1手目が(0,0))" do
					@queen.put_first(0)
					@queen.put_able(1)
					@queen.board.should == [0,2]
				end
				it "(1手目が(1,0))" do
					@queen.put_first(1)
					@queen.put_able(1)
					@queen.board.should == [1,3]
				end
				it "(1手目が(2,0))" do
					@queen.put_first(2)
					@queen.put_able(1)
					@queen.board.should == [2,0]
				end
				it "(1手目が(3,0))" do
					@queen.put_first(3)
					@queen.put_able(1)
					@queen.board.should == [3,0]
				end
			end
			describe "３手目が正常におけるか？" do
				it "(1手目が(0,0))" do
					@queen.put_first(0)
					@queen.put_able(1)
					@queen.put_able(2)
					@queen.board.should == [0,2,4]
				end
				it "(1手目が(1,0))" do
					@queen.put_first(1)
					@queen.put_able(1)
					@queen.put_able(2)
					@queen.board.should == [1,3,0]
				end
			end
			describe "４手目が正常におけるか？" do
				it "(1手目が(0,0))" do
					pending "meet dead end!!!"
					@queen.put_first(0)
					@queen.put_able(1)
					@queen.put_able(2)
					@queen.put_able(3)
					@queen.board.should == [0,2,4,1]
				end
			end
		end
	end
	describe "N = 4 かつ 共通処理のとき"	do
		describe "removeメソッドを呼んだとき" do
			before(:each) do
				@queen = Queen.new(4)
				@queen.board = [0,2,4]
				@queen.left_slash  = [0,3,6]
				@queen.right_slash = [0,1,2]
				@matrix = @queen.remove
			end
			it "盤（@board）からQが除去されるか？" do
				@queen.board.should == [0,2]
			end
			it "左斜め線（@left_slash）からQが除去されるか？" do
				@queen.left_slash.should == [0,3]
			end
			it "右斜め線（@right_slash）からQが除去されるか？" do
				@queen.right_slash.should == [0,1]
			end
			it "取り除いた座標を教えてくれるか？" do
				@matrix.should === 4
			end
		end
	end


end
