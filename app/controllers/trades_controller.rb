class TradesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: TradeDatatable.new(params) }
    end
  end

  def bulk_upload
    return unless params[:commit] == 'Submit'
    
    Trade.import(params[:file])
    redirect_to trades_path
  end
end
