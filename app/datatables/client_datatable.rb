class ClientDatatable < AjaxDatatablesRails::ActiveRecord
  self.nulls_last = true
  delegate :link_to, to: :@view
  delegate :admin_client_path, to: :@view

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      reliance_client_code: { source: "Client.reliance_client_code" },
      reliance_client_id: { source: "Client.reliance_client_id" },
      starmf_client_code: { source: "Client.starmf_client_code" },
      nj_client_code: { source: "Client.nj_client_code" },
      full_name: { source: "Client.first_name" },
      mobile: { source: "Client.phone_number" },
      email: { source: "Client.email" },
      pan: { source: "Client.pan" },
      city: { source: "Client.city" },
      status: { source: "Client.status" },
      sign_in_count: { source: "Client.sign_in_count" },
      last_sign_in_at: { source: "Client.last_sign_in_at" }
    }
  end

  def data
    records.map do |record|
      {
        reliance_client_code: link_to(record.reliance_client_code, admin_client_path(record.reliance_client_code)),
        reliance_client_id: link_to(record.reliance_client_id, admin_client_path(record.reliance_client_code)),
        starmf_client_code: record.starmf_client_code,
        nj_client_code: record.nj_client_code,
        full_name: record.first_name.split('(').first,
        mobile: record.phone_number,
        email: record.email,
        pan: record.pan,
        city: record.city,
        status: record.status.capitalize,
        sign_in_count: record.sign_in_count,
        last_sign_in_at: record.last_sign_in_at&.strftime("%-d-%-m-%y")
      }
    end
  end

  def get_raw_records
    Client.all
  end

end
