$(document).on('turbolinks:load', function() {
  $('#queries-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#queries-datatable').data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "id"},
      {"data": "full_name"},
      {"data": "phone"},
      {"data": "email"},
      {"data": "reason"},
      {"data": "description"}
    ]
    // pagingType is optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
});
