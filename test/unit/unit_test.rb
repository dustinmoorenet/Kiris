require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  test "has data" do
    gram = units(:gram)
    assert_not_nil gram.abbv, "Unit.abbv is not defined"
    assert_equal gram.abbv, 'g', "Gram abbrivation is not 'g'"

    liter = units(:liter)
    assert_not_equal liter.name, 'litter', "Liter is misspelled"
  end
end
