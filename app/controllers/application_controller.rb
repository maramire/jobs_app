class ApplicationController < ActionController::Base
  # set new fields for devise sign up
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def check_profile_completed
    if current_user
      if current_user.company?
        @company = Company.where(user: current_user).first
        if (!@company)
          redirect_to new_company_url
        end
      end
      if current_user.applicant?
        @applicant = Applicant.where(user: current_user).first
        if (!@applicant)
          redirect_to new_applicant_url
        end
      end
    end
  end
end
