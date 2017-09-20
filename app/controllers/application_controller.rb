class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_to_root
    redirect_to root_url, notice: 'You do not have permission to access the requested page.'
  end
end
