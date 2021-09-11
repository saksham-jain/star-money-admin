class InvestNowDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      first_name: { source: "InvestNow.first_name" },
      last_name: { source: "InvestNow.last_name" },
      phone_number: { source: "InvestNow.phone_number" },
      email: { source: "InvestNow.email" }
    }
  end

  def data
    records.map do |record|
      {
        first_name: record.first_name,
        last_name: record.last_name,
        phone_number: record.phone_number,
        email: record.email
      }
    end
  end

  def get_raw_records
    InvestNow.all
  end
end
