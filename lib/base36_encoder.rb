class Base36Encoder
  def self.encode(value)
    value.to_s(36)
  end

  def self.decode(value)
    value.to_i(36)
  end
end
