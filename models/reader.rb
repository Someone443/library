# frozen_string_literal: true

# The library contains the next entities: Authors, Books, Readers, and Orders.
class Reader < Entity
  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    validate(name, email, city, street, house)

    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def to_s
    "Name: #{name}. Email: #{email}. Address: #{city}, #{street}, #{house}."
  end

  def validate(name, email, city, street, house)
    not_empty_strings(name, email, city, street)
    positive_integer(house)
  end
end
