class ApplicationController < ActionController::Base
  include Pundit

  rescue_from (ActiveRecord::RecordNotFound) { |exception| handle_exception(exception, 404) }
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def handle_exception(ex, status)
      render_error(ex, status)
      logger.error ex   
  end

  def render_error(ex, status)
    @status_code = status
    respond_to do |format|
      format.html { render :template => "error", :status => status }
      format.all { render :nothing => true, :status => status }
    end
  end
end
