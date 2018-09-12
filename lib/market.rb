## market.rb

require 'pry'

class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      if vendor.inventory.keys.include?(item)
        vendor
      end
    end
  end

# if there is time...
# I will try to refactor the following methods!


  def sorted_item_list
    list = []
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |item|
        list << item if list.include?(item) == false
      end
    end
    return list.sort
  end

  def total_inventory
    totals = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |key, value|
        if totals[key]
          totals[key] += value
        else
          totals[key] = value
        end
      end
    end
    return totals
  end

  def sell(item, quantity)
    product = total_inventory[item]
    if product == false
      false
    elsif product && product < quantity
      false
    # elsif product && product >= quantity
    #   @vendors.reduce(quantity) do |remaining, vendor|
    #     while remaining > 0 do
    #       remaining -= vendor.sell(item, remaining)
    #     end
    #   end
    #   true
    end
  end

end
