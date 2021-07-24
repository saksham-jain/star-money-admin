class QueryDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Query.id" },
      full_name: { source: "Query.full_name" },
      phone: { source: "Query.phone" },
      email: { source: "Query.email" },
      reason: { source: "Query.reason" }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        full_name: record.full_name,
        phone: record.phone,
        email: record.email,
        reason: record.reason
      }
    end
  end

  def get_raw_records
    Query.all
  end
end
