# -*- encoding: utf-8 -*-
require_relative 'queen'
describe "N-Queen"	do
	before(:each) do
		@queen = Queen.new
	end
	describe "N = 1 のとき"	do
		before do
			@queen.try(1)
		end
		it "クラス名はあっているか？" do
			@queen.class.should == Queen
		end
		it "盤の配置（Board）は初期化されているか？" do
			@queen.board.should == []
		end
	end
end
