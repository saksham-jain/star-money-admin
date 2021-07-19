class Admin::ClientsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: ClientDatatable.new(params, view_context: view_context) }
    end
  end

  def new
    @client = Client.new
  end

  def show
    @client = Client.find_by(reliance_client_code: params[:id])
  end

  def create
    @client = Client.new(client_params.merge(password: 'User@123'))

    respond_to do |format|
      if @client.save
        format.html { redirect_to admin_clients_path, notice: 'Client was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def bulk_upload
    return unless params[:commit] == 'Submit'
    
    Client.import(params[:file])
    redirect_to admin_clients_path
  end

  private

  def client_params
    params.require(:client).permit(:reliance_client_code, :first_name, :last_name, :phone_number, :email, :pan, :city)
  end
end
