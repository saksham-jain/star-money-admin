//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require popper
//= require_tree ./user
//= require toastr
// = require turbolinks

toastr.options = {
  toastClass: 'alert',
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
