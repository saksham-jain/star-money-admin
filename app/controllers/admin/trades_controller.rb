class Admin::TradesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: TradeDatatable.new(params, view_context: view_context) }
    end
  end

  def bulk_upload
    return unless params[:commit] == 'Submit'
    
    client_ids_not_present = Trade.import(params[:file])
    message = client_ids_not_present.present? ? "Please create these clients: #{client_ids_not_present.join(', ')}" : 
      "All trades successfully created!"
    redirect_to admin_trades_path, notice: message
  end
end
