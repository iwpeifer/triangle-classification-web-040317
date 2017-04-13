class Triangle

	attr_accessor :l1, :l2, :l3
  
  def initialize(l1, l2, l3)
  	@sides = [l1, l2, l3]
  end

  def valid?
    if @sides.any?{|s| s <= 0} || @sides.sort[0] + @sides.sort[1] <= @sides.sort[2]
      return false
    else
      return true
    end
  end

  def kind
    if !self.valid?
        raise TriangleError
  	elsif @sides.uniq.size == 1
  		return :equilateral
  	elsif @sides.uniq.size == 2
  		return :isosceles
  	elsif @sides.size == @sides.uniq.size
  		return :scalene
  	end
  end
end

class TriangleError < StandardError
	def message
		"Triangle is whack."
	end
end