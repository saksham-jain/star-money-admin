$(document).on('turbolinks:load', function() {
  $('#trades-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#trades-datatable').data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "exchange"},
      {"data": "actionee"},
      {"data": "client_id"},
      {"data": "client_name"},
      {"data": "order_type"},
      {"data": "txn_type"},
      {"data": "scrip"},
      {"data": "price"},
      {"data": "quantity"},
      {"data": "time"},
      {"data": "date"},
      {"data": "platform"}
    ]
    // pagingType is optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
});