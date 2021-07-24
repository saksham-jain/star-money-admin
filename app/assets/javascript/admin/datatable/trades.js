$(document).on('turbolinks:load', function() {
  var url = new URL(window.location.href);
  var serachKeyword = url.searchParams.get('keyword');
  
  $('#trades-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "aaSorting": [[ 10, 'desc' ]],
    "oSearch": {"sSearch": serachKeyword },
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
  });
});