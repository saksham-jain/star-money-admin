//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require popper
//= require_tree ./user
//= require toastr
// = require turbolinks

toastr.options = {
  toastClass: 'alert',
  timeOut: 8000,
  positionClass: "toast-bottom-right",
  iconClasses: {
      error: 'alert-error',
      info: 'alert-info',
      success: 'alert-success',
      warning: 'alert-warning'
  }
}

$(document).on('turbolinks:load', function(){
  $('.pagination > a').attr('data-remote', 'true');
})
