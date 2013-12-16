class Summer
  def self.sum_of(*values)
    return 0 if values.length == 0

    values = Array(values.first) if values.length == 1

    values.to_a.inject(0,&:+)
  end
end
