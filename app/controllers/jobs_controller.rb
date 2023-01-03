class JobsController < ApplicationController
  def index
    @jobs = Job.all
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
    @job = Job.find(params[:id])
  end
end
