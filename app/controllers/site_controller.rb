class SiteController < ApplicationController
  def get
    name = params[:name]
    site = Site.find_by_name name
    if site.nil?
      site = Site.new name
      site.save
      CreateFolderJob.perform_later(site)
    end
    render json: site
  end

  def update
    name = params[:name]
    site = Site.find_by_name! name
    site.update_attributes!(site_params)
    render json: site
  end

  private
  def site_params
    params.require(:primary)
    params.require(:secondary)
    params.require(:background)
    params.permit(:primary, :secondary, :background)
  end
end
