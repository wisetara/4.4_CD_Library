class Email < ContactItem
  def full
    @property
  end

  def domain
    @property.to_s[(@property.index('@') + 1)..-1]
  end

  def name_part
    @property.to_s[0...(@property.index('@'))]
  end
end
