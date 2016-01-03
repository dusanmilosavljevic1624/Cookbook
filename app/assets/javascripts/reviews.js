var ready = function() {
  $('#my-menu').mmenu();
  var menuAPI = $('#my-menu').data('mmenu');
  $('button').on('click', function(e) {
    if ($('#my-menu').hasClass('mm-opened')) {
      menuAPI.close();
    } else {
      menuAPI.open();
    }
  });

  $('#login-button').on('click', function(e) {
    e.preventDefault();
    $('.overlay').addClass('visible');
    $('#login-form').addClass('visible');
  });

  $('#register-button').on('click', function(e) {
    e.preventDefault();
    $('.overlay').addClass('visible');
    $('#register-form').addClass('visible');
  });

  $('.overlay').on('click', function() {
    $('.overlay').removeClass('visible');
    $('.form').removeClass('visible');
    $('.form').find('input[type=text], input[type=password]').val("");
  });

  $('.form').find('input').on('keyup blur focus', function(e) {
    var $this = $(this),label = $this.prev('label');
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

  $('#mm-blocker').remove();
};

$(document).on('ready', function() {
  ready();
});

$(document).on('page:load', function(e) {
  console.log('load fired');
  ready();
});
