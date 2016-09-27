class CreateFolderJob < ApplicationJob
  queue_as :default

  def perform(site)
    name = site.name
    site_path = File.join(Rails.public_path, 'sites', name)
    FileUtils::mkdir_p site_path
    create_index(site_path)
    UpdateBootstrapJob.perform_now(site)
  end

  private
  def create_index(path)
    from = File.join(Rails.public_path, 'templates', 'index.html')
    to = File.join(path, 'index.html')
    FileUtils::cp(from, to)
  end
end
