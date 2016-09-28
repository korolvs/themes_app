class CreateFolderJob < ApplicationJob
  queue_as :default

  def perform(site)
    name = site.name
    site_path = File.join(Rails.public_path, 'sites', name)
    FileUtils::mkdir_p site_path
    create_index(site_path)
    create_bootstrap(site_path)
    UpdateBootstrapJob.perform_later(site)
  end

  private
  def create_index(path)
    from = File.join(Rails.public_path, 'templates', 'index.html')
    to = File.join(path, 'index.html')
    FileUtils::cp(from, to)
  end

  def create_bootstrap(path)
    from = File.join(Rails.public_path, 'templates', 'bootstrap.css')
    to = File.join(path, 'bootstrap.css')
    FileUtils::cp(from, to)
  end
end
