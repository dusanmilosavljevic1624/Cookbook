$(document).ready(function () {
  $('#my-menu').mmenu();

  var menuAPI = $('#my-menu').data('mmenu');

  console.log(menuAPI);

  $('button').on('click', function (e) {
    console.log('otvorio');
    menuAPI.open();
  });
  console.log('izupado');
});

$(document).on("page:change", function(){
   $('#reviews').click(function(event) {
       event.preventDefault();
      $('#reviews_fields').fadeToggle();
       $('#review_form').fadeToggle();
        $('#review_body').focus();
   });
});
