require_relative '../lib/summer'

describe Summer do
  it "can sum one number" do
    result = Summer.sum_of(1)
    expect(result).to eql(1)
  end

  it "can sum two numbers" do
    result = Summer.sum_of(1, 2)
    expect(result).to eql(3)
  end

  it "can sum three numbers" do
    result = Summer.sum_of(1, 2, 3)
    expect(result).to eql(6)
  end

  it "can sum a range" do
    result = Summer.sum_of(1..10)
    expect(result).to eql(55)
  end

  it "can handle no values" do
    result = Summer.sum_of
    expect(result).to eql(0)
  end
end
