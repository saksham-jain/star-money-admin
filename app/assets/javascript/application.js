//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require popper
//= require_tree ./user
//= require toastr
//= require turbolinks
//= require typed

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

  if ($(".text-slider").length == 1) {
    typed = new Typed(".text-slider", {
      strings: ["Stocks.", "Futures and Options.", "Mutual Funds.", 'SIPs.', 'Commodities.'],
      typeSpeed: 60,
      loop: true,
      backSpeed: 25,
      backDelay: 1500
    });
    }
})
