# -*- encoding: utf-8 -*-
require_relative 'queen'
describe "N-Queen"	do
	describe "N = 1 のとき"	do
		it "開始できるか？" do
			@queen = Queen.new
			@queen.try(1)
		end
		it "盤の配置（Board）は初期化されているか？" do
			@queen.board.should == []
		end
	end
end
