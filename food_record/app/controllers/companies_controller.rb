class CompaniesController < ApplicationController
  # GET /companies
  def index
    logger.info params.inspect

    conditions = {}
    if params[:name] && params[:name] != ''
      conditions[:name] = params[:name]
    end

    if conditions.length > 0
      companies = Company.search :conditions => conditions, :star => true
    else
      companies = []
    end

    render :json => companies
  end
end
