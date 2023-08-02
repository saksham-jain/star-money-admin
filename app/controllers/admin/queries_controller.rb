class Admin::QueriesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: QueryDatatable.new(params, view_context: view_context) }
    end
  end
end
