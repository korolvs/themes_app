class CheckForUpdatesJob < ApplicationJob
  queue_as :default

  def perform
    sites = Site.just_updated
    sites.each do |site|
      UpdateBootstrapJob.perform_now site
    end
  end

  after_perform do |_|
    CheckForUpdatesJob.set(wait: 12.seconds).perform_later
  end
end
