# Code

class Code
  attr_accessor :code
  
  def initialize()
    @base = (1..6).to_a
    @code = []
    4.times { @code.push(base.sample) }
  end

end
