$(document).on('turbolinks:load', function() {
  $('#clients-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#clients-datatable').data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "reliance_client_code"},
      {"data": "full_name"},
      {"data": "mobile"},
      {"data": "email"},
      {"data": "pan"},
      {"data": "city"},
      {"data": "sign_in_count"},
      {"data": "last_sign_in_at"},
      {"data": "status"}
    ]
    // pagingType is optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
});