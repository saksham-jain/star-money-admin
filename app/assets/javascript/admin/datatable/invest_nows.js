$(document).on('turbolinks:load', function() {
  $('#invest-nows-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#invest-nows-datatable').data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "first_name"},
      {"data": "last_name"},
      {"data": "phone_number"},
      {"data": "email"}
    ]
    // pagingType is optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
});
