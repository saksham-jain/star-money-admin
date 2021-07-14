class TradeDatatable < AjaxDatatablesRails::ActiveRecord
  self.nulls_last = true

  def view_columns
    @view_columns ||= {
      exchange: { source: "Trade.exchange" },
      actionee: { source: "Trade.actionee" },
      client_id: { source: "Trade.client_id" },
      client_name: { source: "Trade.client_name" },
      order_type: { source: "Trade.order_type" },
      txn_type: { source: "Trade.transaction_type" },
      scrip: { source: "Trade.scrip" },
      price: { source: "Trade.price" },
      quantity: { source: "Trade.quantity" },
      time: { source: "Trade.time" },
      date: { source: "Trade.date" },
      platform: { source: "Trade.platform" }
    }
  end

  def data
    records.map do |record|
      {
        exchange: record.exchange,
        actionee: record.actionee,
        client_id: record.client_id,
        client_name: record.client_name,
        order_type: record.order_type,
        txn_type: record.transaction_type,
        scrip: record.scrip,
        price: record.price,
        quantity: record.quantity,
        time: record.time,
        date: record.date,
        platform: record.platform
      }
    end
  end

  def get_raw_records
    Trade.all
  end
end
