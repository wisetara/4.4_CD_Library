class Address < ContactItem

  attr_reader :street, :city, :state, :zip

  def format
    @street + " " + @city + ", " + @state + " " + @zip
  end

  def initialize(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
  end

  def edit(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
  end

end
