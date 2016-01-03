var ready = function(){

  $('#my-menu').mmenu();

  var menuAPI = $('#my-menu').data('mmenu');

  $('button').on('click', function () {
    if($('#my-menu').hasClass('mm-opened')){
      console.log('opened');
      menuAPI.close();
    }else{
      console.log('closed');
      menuAPI.open();
    }
  })


  console.log($('#mm-blocker').length);
};

$(document).on('ready', ready);

$(document).on('page:load', function (e) {
  console.log(e);
  console.log('page load fired');
  ready();

  $('#mm-blocker').remove();

});
