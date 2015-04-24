class Summer
  def self.sum_of(*values)
    values = Array(values.first) if values.length == 1
    values.to_a.inject(0,&:+)
  end
end
