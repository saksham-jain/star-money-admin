//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require popper
//= require datatables.js
//= require toastr
//= require_tree ./admin

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
