class ApplicantsController < ApplicationController
  def index
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
    @applicant = Applicant.find(params[:id])
  end
end
