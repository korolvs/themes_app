require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  test "site create success" do
    # prepare
    name = primary = secondary = background = Faker::Lorem.characters(10)

    # action
    site = Site.new(name, primary, secondary, background)
    site.save

    # check results
    assert_equal name, site.name
    assert_equal primary, site.primary
    assert_equal secondary, site.secondary
    assert_equal background, site.background
  end

  test "site create with wrong params fails" do
    # prepare
    name = primary = secondary = background = nil

    # action
    site = Site.new(name, primary, secondary, background)
    site.save

    # check results
    assert site.invalid?
    assert_includes site.errors[:name], "can't be blank"
    assert_includes site.errors[:primary], "can't be blank"
    assert_includes site.errors[:secondary], "can't be blank"
    assert_includes site.errors[:background], "can't be blank"
  end

  test "site create duplication fail" do
    # prepare
    name = primary = secondary = background = Faker::Lorem.characters(10)
    site = Site.new(name, primary, secondary, background)
    site.save

    # action
    site = Site.new(name, primary, secondary, background)
    site.save

    # check results
    assert site.invalid?
    assert_includes site.errors[:name], "has already been taken"
  end
end
