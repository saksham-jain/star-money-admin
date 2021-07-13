class TradesController < ApplicationController
  def index
    @trades = Trade.all
  end

  def bulk_upload
    return unless params[:commit] == 'Submit'
    
    Trade.import(params[:file])
    redirect_to trades_path
  end
end
