class JobApplicationsController < ApplicationController
  def index
    @applications = JobApplication.where(applicant: params[:applicant_id])
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
end
