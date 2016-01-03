$(document).ready(function () {
  $('#my-menu').mmenu();

  var menuAPI = $('#my-menu').data('mmenu');

  $('button').on('click', function (e) {
    menuAPI.open();
  });
});
