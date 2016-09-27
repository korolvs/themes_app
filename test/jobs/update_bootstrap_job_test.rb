require 'test_helper'

class UpdateBootstrapJobTest < ActiveJob::TestCase
  test "should create files" do
    # prepare
    name = Faker::Lorem.characters(10)
    site = Site.new(name)
    site.save
    path = File.join(Rails.public_path, 'sites', name)
    FileUtils::mkdir_p path

    # action
    UpdateBootstrapJob.perform_now(site)

    # check results
    file1 = File.join(path, 'custom_variables.less')
    file2= File.join(path, 'bootstrap.css')
    assert File.exists? file1
    assert File.exists? file2
  end

  test "should update files" do
    # prepare
    name = Faker::Lorem.characters(10)
    site = Site.new(name)
    site.save
    path = File.join(Rails.public_path, 'sites', name)
    FileUtils::mkdir_p path
    UpdateBootstrapJob.perform_now(site)
    file1 = File.join(path, 'custom_variables.less')
    file2= File.join(path, 'bootstrap.css')
    ctime1 = File.ctime(file1)
    ctime2 = File.ctime(file2)

    # action
    UpdateBootstrapJob.perform_now(site)

    # check results
    assert File.ctime(file1) > ctime1
    assert File.ctime(file2) > ctime2
  end
end
