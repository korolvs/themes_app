require 'test_helper'

class SiteControllerTest < ActionDispatch::IntegrationTest
  ## get

  test "should on get create a new site  with new name" do
    # prepare
    name = Faker::Lorem.characters(10)

    # action
    get get_url(name)

    # check results
    assert_response :success
    site = JSON.parse(response.body)
    assert_equal name, site['name']
  end

  test "should on get return an existing site" do
    # prepare
    name = Faker::Lorem.characters(10)
    site = Site.new(name)
    site.save
    id = site.id

    # action
    get get_url(name)

    # check results
    assert_response :success
    site = JSON.parse(response.body)
    assert_equal id, site['id']
    assert_equal name, site['name']
  end

  ## update

  test "should update the site on update" do
    # prepare
    name = Faker::Lorem.characters(10)
    Site.new(name).save
    primary, secondary, background = Faker::Lorem.characters(10), Faker::Lorem.characters(10), Faker::Lorem.characters(10)
    params = { primary: primary, secondary: secondary, background: background}

    # action
    put update_url(name), params: params

    # check results
    assert_response :success
    site = JSON.parse(response.body)
    assert_equal name, site['name']
    assert_equal primary, site['primary']
    assert_equal secondary, site['secondary']
    assert_equal background, site['background']
  end

  test "should not update the site with wrong params on update" do
    # prepare
    name = Faker::Lorem.characters(10)
    Site.new(name).save

    # action
    put update_url(name)

    # check results
    assert_response :bad_request
  end

  test "should not update the site that not exists on update" do
    # prepare
    name = Faker::Lorem.characters(10)

    # action
    put update_url(name)

    # check results
    assert_response :not_found
  end
end
