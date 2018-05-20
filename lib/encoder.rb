class Encoder
  CODE_LENGTH = 6

  def self.encode(id)
    code = id.to_s(36)
    sufix = (code.length > CODE_LENGTH) ? "" : "0" * (CODE_LENGTH - code.length)
    sufix + code
  end

  def self.decode(code)
    code.to_i(36)
  end
end
