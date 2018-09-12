## market_test.rb

require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/market'
require 'pry'

class MarketTest < Minitest::Test

  def test_it_exists
    market = Market.new("South Pearl Street Farmers Market")
    assert_instance_of(Market, market)
  end

  def test_it_has_a_name
    market = Market.new("South Pearl Street Farmers Market")
    expected = "South Pearl Street Farmers Market"
    assert_equal(expected, market.name)
  end

  def test_it_starts_with_empty_vendor_list
    market = Market.new("South Pearl Street Farmers Market")
    assert_equal([], market.vendors)
  end

  def test_it_can_add_vendors
    market = Market.new("South Pearl Street Farmers Market")
    assert_equal([], market.vendors)
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    assert_equal(3, market.vendors.length)
    market.vendors.map do |vendor|
      assert_equal(Vendor, vendor.class)
    end
  end

  def test_it_can_return_vendor_name_list
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal(expected, market.vendor_names)
  end

  def test_it_can_list_all_vendors_that_sell_an_item
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)
    actual = market.vendors_that_sell("Peaches").length
    assert_equal(2, actual)
    market.vendors_that_sell("Peaches").map do |vendor|
      assert_equal(Vendor, vendor.class)
    end
    actual = market.vendors_that_sell("Banana Nice Cream").length
    assert_equal(1, actual)
    market.vendors_that_sell("Banana Nice Cream").map do |vendor|
      assert_equal(Vendor, vendor.class)
    end
  end

    def test_it_can_return_sorted_items_list
      market = Market.new("South Pearl Street Farmers Market")
      vendor_1 = Vendor.new("Rocky Mountain Fresh")
      vendor_1.stock("Peaches", 35)
      vendor_1.stock("Tomatoes", 7)
      vendor_2 = Vendor.new("Ba-Nom-a-Nom")
      vendor_2.stock("Banana Nice Cream", 50)
      vendor_2.stock("Peach-Raspberry Nice Cream", 25)
      vendor_3 = Vendor.new("Palisade Peach Shack")
      vendor_3.stock("Peaches", 65)
      market.add_vendor(vendor_1)
      market.add_vendor(vendor_2)
      market.add_vendor(vendor_3)
      expected = ["Banana Nice Cream", "Peach-Raspberry Nice Cream", "Peaches", "Tomatoes"]
      actual = market.sorted_item_list
      assert_equal(expected, actual)
    end

end
