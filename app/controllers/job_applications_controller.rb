class JobApplicationsController < ApplicationController
  def index
    @applications = JobApplication.where(applicant: params[:applicant_id])
  end

  def new
    @job = Job.find(params[:job_id]) 
    @applicant = Applicant.where(user: current_user).first   
    if JobApplication.where(applicant: @applicant, job: @job).first
      redirect_to @job, notice: 'You have already applied before.'
      return
    end
    @job_application = JobApplication.new(job: @job, applicant: @applicant)
    @job.questions.each do |q|
      @job_application.answers.new(question: q)
    end
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    if JobApplication.where(applicant: @job_application.applicant, job: @job_application.job).first
      redirect_to @job_application.job, notice: 'You have already applied before.'
      return
    end
    if @job_application.save
      redirect_to @job_application.job, notice: 'Job Application was successfully submitted.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @job = Job.find(params[:job_id])
    @applicant = Applicant.where(user: current_user).first   
    @job_application = JobApplication.where(job: @job, applicant: @applicant).first
    @job_application.destroy
    redirect_to @job, notice: 'Job Application was successfully removed.'
  end

  def show
  end

  private

  def job_application_params
    params.require(:job_application).permit(
      :applicant_id,
      :job_id,
      answers_attributes: [:answer_text, :question_id]
    )
  end
end
