class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do
    render :status => 404
  end

  rescue_from ActionController::ParameterMissing do
    render :status => 400
  end
end
