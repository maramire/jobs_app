class CompaniesController < ApplicationController
  def index
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      redirect_to jobs_url
    else
      render "new"
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:success] = "Company successfully updated."
      redirect_to company_url(@company)
    else
      render :edit
    end
  end

  def new
    @company = Company.new
  end

  def destroy
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name, :photo)
  end
end
