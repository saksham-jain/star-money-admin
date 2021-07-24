class Admin::TradesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: TradeDatatable.new(params, view_context: view_context) }
    end
  end

  def bulk_upload
    return unless params[:commit] == 'Submit'
    
    Trade.import(params[:file])
    redirect_to admin_trades_path
  end
end
