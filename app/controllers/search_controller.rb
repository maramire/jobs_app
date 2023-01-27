class SearchController < ApplicationController
  def index
    @query = Job.ransack(params[:q])
    @pagy, @jobs = pagy(@query.result(distinct: true), items: 10)
    render "jobs/index"
  end
end
