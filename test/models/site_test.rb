require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  test "should create site" do
    # prepare
    name = Faker::Lorem.characters(10)

    # action
    site = Site.new(name)
    site.save

    # check results
    assert_equal site.name, name
    assert_equal site.primary, Site::DEFAULT_PRIMARY
    assert_equal site.secondary, Site::DEFAULT_SECONDARY
    assert_equal site.background, Site::DEFAULT_BACKGROUND
  end

  test "should not create with wrong params" do
    # prepare
    name = nil

    # action
    site = Site.new(name)
    site.save

    # check results
    assert site.invalid?
    assert_includes site.errors[:name], "can't be blank"
  end

  test "should not create two sites with the same name" do
    # prepare
    name = Faker::Lorem.characters(10)
    site = Site.new(name)
    site.save

    # action
    site = Site.new(name)
    site.save

    # check results
    assert site.invalid?
    assert_includes site.errors[:name], "has already been taken"
  end
end
