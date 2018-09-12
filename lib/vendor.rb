## vendor.rb

require 'pry'

class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item]
      return @inventory[item]
    else
      return 0
    end
  end

  def stock(item, number)
    if @inventory[item]
      @inventory[item] += number
    else
      @inventory[item] = number
    end
  end

  def sell(item, quantity)
    if @inventory[item] == nil
      return 0
    elsif @inventory[item] && @inventory[item] >= quantity
      @inventory[item] -= quantity
      return "satisfied customer"
    elsif @inventory[item] && @inventory[item] < quantity
      available = @inventory[item]
      @inventory[item] -= available
      return available
    end
  end

end
