require_relative '../lib/summer'

test "can sum one number" do
  result = Summer.sum_of(1)
  assert result == 1
end

test "can sum two numbers" do
  result = Summer.sum_of(1, 2)
  assert result == 3
end

test "can sum three numbers" do
  result = Summer.sum_of(1, 2, 3)
  assert result == 6
end

test "can sum a range" do
  result = Summer.sum_of(1..10)
  assert result == 55
end

test "can handle no values" do
  result = Summer.sum_of
  assert result == 0
end
