class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => t('access_denied')
    end
  end

  def set_locale
    params[:locale] || I18n.locale = "pt-BR"
  end
end
