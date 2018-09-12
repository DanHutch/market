## vendor_test.rb

require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require 'pry'

class VendorTest < Minitest::Test

  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of(Vendor, vendor)
  end

  def test_it_has_a_name
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal("Rocky Mountain Fresh", vendor.name)
  end

  def test_it_starts_with_empty_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal({}, vendor.inventory)
  end

  def test_it_can_check_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal(0, vendor.check_stock("Peaches"))
  end

  def test_it_can_stock_items
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal(0, vendor.check_stock("Peaches"))
    vendor.stock("Peaches", 30)
    assert_equal(30, vendor.check_stock("Peaches"))
    vendor.stock("Peaches", 25)
    assert_equal(55, vendor.check_stock("Peaches"))
    vendor.stock("Tomatoes", 12)
    assert_equal(12, vendor.check_stock("Tomatoes"))
    expected = {"Peaches"=>55, "Tomatoes"=>12}
    assert_equal(expected, vendor.inventory)
  end

  def test_a_vendor_can_sell_an_item
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    vendor.stock("Plums", 40)
    expected = 0
    actual = vendor.sell("Onions", 20)
    assert_equal(expected, actual)
    expected = "satisfied customer"
    actual = vendor.sell("Peaches", 20)
    assert_equal(expected, actual)
    assert_equal(10, vendor.check_stock("Peaches"))
    actual = vendor.sell("Plums", 45)
    assert_equal(40, actual)
  end

end
