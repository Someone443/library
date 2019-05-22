# frozen_string_literal: true

# The library contains the next entities: Authors, Books, Readers, and Orders.
class Reader
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    if ([name, email, city, street].any? { |a| a == '' || !(a.is_a? String) }) ||
       !((house.is_a? Integer) && house.positive?)
      raise ValidationError
    end

    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def to_s
    "Name: #{name}. Email: #{email}. Address: #{city}, #{street}, #{house}."
  end
end
