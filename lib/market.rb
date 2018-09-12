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
# I will try to refactor the following two methods!


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

end
