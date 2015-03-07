$( document ).ready(function() {

//  $('.custom_radio2').hover(function(){
//     $(this).css("background-color", "#B2CFE2");
//      }, function(){
//      $(this).css("background-color", "#bdc3c7");
//  });


  $('.edit_celebrity').submit(function (){
      console.log('flipping');
      $(this.parentNode.parentNode).addClass('flip');
   });

   $('.change-vote').click(function (){
   // $.post($(this).attr('action'), $(this).serialize(), null, "script");
      console.log('got it here unflip');
      thing = this;
      $(this.parentNode.parentNode.parentNode).removeClass('flip');
   });

   $(window).on ("scroll", function (){
     $('.edit_celebrity').submit(function (){
       console.log('flipping');
       $(this.parentNode.parentNode).addClass('flip');
     });

     $('.change-vote').click(function (){
       thing = this;
       $(this.parentNode.parentNode.parentNode).removeClass('flip');
     });
   });


   $(document).ajaxError(function (e, xhr, settings) {
        if (xhr.status == 401) {
          window.location.replace("/users/sign_up");
        }
    });

});
