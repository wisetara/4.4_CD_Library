class Phone < ContactItem
  def full
    @property
  end

  def area_code
    @property[0...@property.index('-')]
  end

  def digits
    @property[(@property.index('-')+1)..-1]
  end
end
