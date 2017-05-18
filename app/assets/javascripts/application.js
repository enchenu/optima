// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require bootbox
//= require jquery
//= require jquery_ujs
//= require jquery.min
//= require notifyjs
//= require bootstrap/bootstrap.min
//= require plugins
//= require bootstrap-select/bootstrap-select
//= require bootstrap-toggle/bootstrap-toggle.min
//= require sweet-alert/sweet-alert.min
//= require kode-alert/main
//= require jquery-mask.min
//= require datatables/datatables.min

/* Sobre esccrive el data-confirm del Rails */
$.rails.allowAction = function(element) {
  var message = element.attr('data-confirm');
  if (!message) { return true; }

  var opts = {
    title: "Confirmación",
    message: message,
    buttons: {
        confirm: {
            label: 'Aceptar',
            className: 'btn-success'
        },
        cancel: {
            label: 'Cancelar',
            className: 'btn-danger'
        }
    },
    callback: function(result) {
      if (result) {
        element.removeAttr('data-confirm');
        element.trigger('click.rails')
      }
    }
  };

  bootbox.confirm(opts);

  return false;
}