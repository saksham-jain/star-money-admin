class User::QueriesController < ApplicationController
  def new
    flash.now[:info] = 'Submit your query or contact us over phone/email'
    @query = Query.new
    @queries = Query.where(email: current_client.email) if current_client
  end

  def create
    @query = Query.new(query_params)
    if @query.save
      flash[:success] = 'Your Query has been registered. You will be contacted soon if required'
      redirect_to root_path
    else
      flash.now[:warning] = @query.errors.full_messages.join(",")
      render :new
    end
  end

  private

  def query_params
    params.require(:query).permit(:reason, :full_name, :email, :phone, :description)
  end
end
