class ClientDatatable < AjaxDatatablesRails::ActiveRecord
  self.nulls_last = true
  def view_columns
    @view_columns ||= {
      reliance_client_code: { source: "Client.reliance_client_code" },
      full_name: { source: "Client.first_name" },
      mobile: { source: "Client.phone_number" },
      email: { source: "Client.email" },
      pan: { source: "Client.pan" },
      city: { source: "Client.city" },
      status: { source: "Client.status" }
    }
  end

  def data
    records.map do |record|
      {
        reliance_client_code: record.reliance_client_code,
        full_name: record.first_name,
        mobile: record.phone_number,
        email: record.email,
        pan: record.pan,
        city: record.city,
        status: record.status.capitalize
      }
    end
  end

  def get_raw_records
    Client.all
  end

end
