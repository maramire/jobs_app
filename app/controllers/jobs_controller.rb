class JobsController < ApplicationController
  before_action :authenticate_user!, :check_profile_completed

  def index
    if current_user.applicant?
      @pagy, @jobs = pagy(Job.all.order(created_at: :desc), items: 10)
    elsif current_user.company?
      @company = Company.where(user: current_user).first
      @pagy, @jobs = pagy(Job.where(company: @company).order(created_at: :desc), items: 10)
    end
  end

  def create
    @job = Job.new(job_params)
    @company = Company.where(user: current_user).first
    @job.company = @company
    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
    @job = Job.new
    3.times do 
      @job.questions.build
    end
  end

  def show
    @job = Job.find(params[:id])
  end
  
  private

  def job_params
    params.require(:job).permit(
      :title,
      :description,
      :salary,
      :currency,
      :publication_date,
      :expiration_date,
      :minimum_experience,
      :maximum_experience,
      :is_inclusive,
      :vacant_number,
      :location,
      questions_attributes: [:title]
    )
  end

  def testing
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
