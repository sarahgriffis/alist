$( document ).ready(function() {

  $('.collection_radio_buttons').hover(function(){
     $(this).css("background-color", "#B2CFE2");
      }, function(){
      $(this).css("background-color", "#bdc3c7");
  });


  $('.edit_celebrity').submit(function (){
      $(this.parentNode.parentNode).addClass('flip');
   });

   ($('.change-vote')).submit(function (){
   // $.post($(this).attr('action'), $(this).serialize(), null, "script");
      console.log('got it here');
      thing = this;
      $(this.parentNode.parentNode).addClass('flip');
   });


//  $(":checked").parents('label').css({
//    'border-color' : 'black',
//    'border-style' : 'solid'
//  });
   $(document).ajaxError(function (e, xhr, settings) {
        if (xhr.status == 401) {
           //$('.selector').html(xhr.responseText);
          //location.reload();
          window.location.replace("/users/sign_up");
        }
    });

});
