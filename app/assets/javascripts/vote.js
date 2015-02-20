$( document ).ready(function() {

  $('.collection_radio_buttons').hover(function(){
     $(this).css("background-color", "#B2CFE2");
      }, function(){
      $(this).css("background-color", "#bdc3c7");
  });


  $('#edit_celebrity_1').submit(function (){
    $.post($(this).attr('action'), $(this).serialize(), null, "script");
    console.log('got it here');
    return false;
  });

//  $(":checked").parents('label').css({
//    'border-color' : 'black',
//    'border-style' : 'solid'
//  });

});
