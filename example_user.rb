class User
  attr_accessor :name, :email                 # Creates getterse and setters

  def initialize(attributes = {})
    @name = attributes[:name]                 # @name, @email are instance variables
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end