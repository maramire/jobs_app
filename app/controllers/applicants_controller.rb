class ApplicantsController < ApplicationController
  def index
  end

  def create
    @applicant = Applicant.new(applicant_params)
    @applicant.user = current_user
    if @applicant.save
      redirect_to jobs_url
    else
      render "new"
    end
  end

  def edit
    @applicant = Applicant.find(params[:id])
  end

  def update
    @applicant = Applicant.find(params[:id])
    if @applicant.update(applicant_params)
      flash[:success] = "Applicant successfully updated."
      redirect_to applicant_url(@applicant)
    else
      render :edit
    end
  end

  def destroy
  end

  def new
    @applicant = Applicant.new
  end

  def show
    @applicant = Applicant.find(params[:id])
  end

  private

  def applicant_params
    params.require(:applicant).permit(
      :first_name,
      :last_name,
      :birth_date,
      :job_title,
      :description,
      :is_working,
      :country,
      :address,
      :genre,
      :logo,
      :is_disabled_person,
      :expected_salary,
      :currency
    )
  end
end
