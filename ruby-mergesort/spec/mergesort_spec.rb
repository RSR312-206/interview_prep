require 'spec_helper'
require_relative '../mergesort'

describe "#merge_sort" do
    it "orders the array" do
      main_arr = [1,4,5,3,2]
      expect(merge_sort(main_arr)).to eq([1,2,3,4,5])
    end
    it "orders the array when values are 0" do
      main_arr = [0,0]
      expect(merge_sort(main_arr)).to eq([0,0])
    end
  end
describe"#sort" do
  xit "sorts the left and right arrays" do
    right = [34,56]
    left = [-1,4,900]
    expect(merge(left, right)).to eq([-1, 4, 34, 56, 900])
  end
  xit "sorts arrays with negative numbers" do
    right = [-1]
    left = [-1000]
    expect(merge(left, right)).to eq([-1000,-1])
  end
end