$(document).on("page:change", function(){
   $('#reviews').click(function(event) {
       event.preventDefault();
      $('#reviews_fields').fadeToggle();
       $('#review_form').fadeToggle();
        $('#review_body').focus();
   })
});