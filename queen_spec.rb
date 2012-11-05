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
		describe "put_ableメソッドを呼んだとき"	do

			it "put_ableメソッドは規定回数呼ばれるか？" do
				@queen.should_receive(:put_able).exactly(1)
				@queen.try
			end
		end
	end
end
