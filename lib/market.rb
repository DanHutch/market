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

end
