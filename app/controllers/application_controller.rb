class ApplicationController < ActionController::Base
  include Pagy::Backend
  # set new fields for devise sign up
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_query

  def set_query
    @query = Job.ransack(params[:q])
  end

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
