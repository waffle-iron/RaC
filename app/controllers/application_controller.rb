class ApplicationController < ActionController::Base
  before_filter :theme_objects
  before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def theme_objects
    # @header = Theme::Header.new
    @title = ""
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
