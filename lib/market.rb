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

#if there is time I will refactor this method
  def sorted_item_list
    list = []
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |item|
        if list.include?(item) == false
          list << item
        end
      end
    end
    return list.sort
  end

end
