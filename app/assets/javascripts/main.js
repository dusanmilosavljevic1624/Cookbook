$(document).ready(function(){

  $('#my-menu').mmenu();

  var menuAPI = $('#my-menu').data('mmenu');

  menuAPI.open();

  $('#my-button').on('click', function(e){
    menuAPI.open();
  });

  $('#close-button').on('click', function(){
    menuAPI.close();
  });

  //  ////////////////////////////////////////////////////////////////////////////
  //  Forms
  //  ////////////////////////////////////////////////////////////////////////////

  $('#login-button').on('click', function(e){
    e.preventDefault();
    $('.overlay').addClass('visible');
    $('#login-form').addClass('visible');
  });

  $('#register-button').on('click', function(e){
    e.preventDefault();
    $('.overlay').addClass('visible');
    $('#register-form').addClass('visible');
  });

  $('.form').find('input').on('keyup blur focus', function(e) {

    var $this = $(this),
      label = $this.prev('label');

    if (e.type === 'keyup') {
      if ($this.val() === '') {
        label.removeClass('active highlight');
      } else {
        label.addClass('active highlight');
      }
    } else if (e.type === 'blur') {
      if ($this.val() === '') {
        label.removeClass('active highlight');
      } else {
        label.removeClass('highlight');
      }
    } else if (e.type === 'focus') {

      if ($this.val() === '') {
        label.removeClass('highlight');
      } else if ($this.val() !== '') {
        label.addClass('highlight');
      }
    }
  });

  $('.overlay').on('click', function(){
    $('.overlay').removeClass('visible');
    $('.form').removeClass('visible');
    console.log($('.form'));
  });

});

$(window).load(function(){

    $('#sendvic, #drugo, #cuisine').mCustomScrollbar();
})
