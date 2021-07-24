class User::QueriesController < ApplicationController
  def new
    @query = Query.new
  end

  def create
    Query.create(query_params)
  end

  private

  def query_params
    params.require(:query).permit(:reason, :full_name, :email, :phone)
  end
end
