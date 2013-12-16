gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/summer'

describe Summer do
  it "can sum one number" do
    result = Summer.sum_of(1)
    result.must_equal 1
  end

  it "can sum two numbers" do
    result = Summer.sum_of(1, 2)
    result.must_equal 3
  end

  it "can sum three numbers" do
    result = Summer.sum_of(1, 2, 3)
    result.must_equal 6
  end

  it "can sum a range" do
    result = Summer.sum_of(1..10)
    result.must_equal 55
  end

  it "can handle no values" do
    result = Summer.sum_of
    result.must_equal 0
  end
end
