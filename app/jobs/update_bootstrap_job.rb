class UpdateBootstrapJob < ApplicationJob
  queue_as :default

  def perform(site)
    name = site.name
    site_path = File.join(Rails.public_path, 'sites', name)
    create_variables(site_path, site)
    run_grunt(site_path)
  end

  private
  def create_variables(path, site)
    file = File.join(path, 'custom_variables.less')
    FileUtils.rm(file) if File.exists?(file)
    File.open(file, 'w') do |f|
      f.puts "@brand-primary: #{site.primary};"
      f.puts "@brand-success: #{site.secondary};"
      f.puts "@body-bg: #{site.background};"
    end
  end

  def run_grunt(site_path)
    file = File.join(site_path, 'bootstrap.css')
    FileUtils.rm(file) if File.exists?(file)
    `docker run -v #{site_path}:/public themesapp/grunt`
  end
end
