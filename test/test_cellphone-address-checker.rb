require File.dirname(__FILE__) + '/test_helper.rb'

module CellphoneAddressChecker
  class TestCellphoneAddressChecker < Test::Unit::TestCase

    def setup
    end

    def test_get_carrier
      assert_equal(
        :docomo,
        CellphoneAddressChecker::get_carrier("hogeaddress@docomo.ne.jp")
      )
      assert_equal(
        :docomo,
        CellphoneAddressChecker::get_carrier("hogeaddress@docomo.blackberry.com")
      )
      assert_equal(
        :softbank,
        CellphoneAddressChecker::get_carrier("hogeaddress@i.softbank.jp")
      )
      assert_equal(
        :au,
        CellphoneAddressChecker::get_carrier("hogeaddress@ezweb.ne.jp")
      )
      assert_equal(
        :willcom,
        CellphoneAddressChecker::get_carrier("hogeaddress@dk.pdx.ne.jp")
      )
      assert_equal(
        nil,
        CellphoneAddressChecker::get_carrier("hogeaddress@example.com")
      )
    end
    
    def test_cellphone_address?
      assert_equal(
        true,
        CellphoneAddressChecker::cellphone_address?("hogeaddress@docomo.ne.jp")
      )
      assert_equal(
        true,
        CellphoneAddressChecker::cellphone_address?("hogeaddress@docomo.blackberry.com")
      )
      assert_equal(
        true,
        CellphoneAddressChecker::cellphone_address?("hogeaddress@i.softbank.jp")
      )
      assert_equal(
        true,
        CellphoneAddressChecker::cellphone_address?("hogeaddress@ezweb.ne.jp")
      )
      assert_equal(
        true,
        CellphoneAddressChecker::cellphone_address?("hogeaddress@dk.pdx.ne.jp")
      )
      assert_equal(
        false,
        CellphoneAddressChecker::cellphone_address?("hogeaddress@example.com")
      )
    end

    def test_truth
      assert true
    end
  end
end
