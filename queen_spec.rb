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
			it "一手目のy=0,x=0で置けるか判定するput_ableメソッドを呼び出すか？" do
				@queen.should_receive(:put_able_check?).at_least(1)
				@queen.put_first(0)
			end
		end
		describe "put_able_check?メソッドを呼んだとき"	do
			it "一手目のy=0,x=0で置けるか判定するとき、置ける（true）を返すか？" do
				@queen.put_able_check?(0,0).should be_true
			end
		end
		describe "put_ableメソッドを呼んだとき"	do
			it "put_ableメソッドは規定回数呼ばれるか？" do
				@queen.should_receive(:put_able).exactly(1)
				@queen.try
			end
		end
	end
end
