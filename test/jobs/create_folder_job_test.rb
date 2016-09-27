require 'test_helper'

class CreateFolderJobTest < ActiveJob::TestCase
  test "should create a path" do
    # prepare
    name = Faker::Lorem.characters(10)
    site = Site.new(name)
    site.save
    UpdateBootstrapJob.expects(:perform_now).with(site).returns(0)

    # action
    CreateFolderJob.perform_now(site)

    # check results
    file = File.join(Rails.public_path, 'sites', name, 'index.html')
    assert File.exists? file
  end
end
