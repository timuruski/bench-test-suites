require 'riot'
require_relative '../lib/summer'

context "sum of one number" do
  setup { Summer.sum_of(1) }
  asserts { topic == 1 }
end

context "sum of two numbers" do
  setup { Summer.sum_of(1,2) }
  asserts { topic == 3 }
end

context "sum of three numbers" do
  setup { Summer.sum_of(1,2,3) }
  asserts { topic == 6 }
end

context "sum of a range" do
  setup { Summer.sum_of(1..10) }
  asserts { topic == 55 }
end

context "sum of nothing" do
  setup { Summer.sum_of }
  asserts { topic == 0 }
end
