class JobsController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.applicant?
      @jobs = Job.all
    elsif current_user.company?
      @company = Company.where(user: current_user).first
      @jobs = Job.where(company: @company )      
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
    )
  end
end
