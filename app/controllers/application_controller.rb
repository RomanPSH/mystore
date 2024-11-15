class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  add_flash_types :success, :danger, :info, :warning
  helper_method :show_footer?
  
  private

  def show_footer?
    !(controller_name == 'sessions' && action_name == 'new') &&
    !(controller_name == 'registrations' && action_name == 'new') &&
    !(controller_name == 'registrations' && action_name == 'new')
  end
end
