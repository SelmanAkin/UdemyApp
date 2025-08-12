class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
  end
  

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    redirect_to(request.referrer || root_path, alert: "Bu işlemi yapmaya yetkiniz yok.")
  end
  
  def after_sign_in_path_for(resource)
   case resource.role
   
   when "admin"
    admin_dashboard_path
   
   when "instructor"
    instructor_dashboard_path
   
   when "student"
    student_dashboard_path
   
   else
    root_path
   end
  end
end
