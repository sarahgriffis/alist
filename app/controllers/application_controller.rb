class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_if_admin
    if Rails.env.production?
      unless current_user.admin
        flash[:alert] = 'You must be an admin to do that!'
        redirect_to root_path
      end
    end
  end
end
