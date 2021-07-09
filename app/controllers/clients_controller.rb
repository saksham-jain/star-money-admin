class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path, notice: 'Client was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def bulk_upload
    return unless params[:commit] == 'Submit'
    
    Client.import(params[:file])
    redirect_to clients_path
  end

  def show; end

  private

  def client_params
    params.require(:client).permit(:reliance_client_code, :first_name, :last_name, :phone_number, :email, :pan, :city)
  end
end
