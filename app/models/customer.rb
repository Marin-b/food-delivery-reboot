class Customer
  attr_reader :name, :address
  attr_accessor :id
  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
    @address = attributes[:address]
  end

  def to_string
    "#{@name} - #{@address}"
  end
end
