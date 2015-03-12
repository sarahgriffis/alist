$( document ).ready(function() {

//  $('.custom_radio2').hover(function(){
//     $(this).css("background-color", "#B2CFE2");
//      }, function(){
//      $(this).css("background-color", "#bdc3c7");
//  });

  if ($('#infinite-scrolling').size() > 0) {
    $(window).on ("scroll", function() {
      more_posts_url = $('.pagination .next_page').attr('href');
      console.log(more_posts_url)
      if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 100){
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript(more_posts_url)
        return
      };
    });
    return
  };
//  $('.edit_celebrity').submit(function (){
//      console.log('flipping');
//      $(this.parentNode.parentNode).addClass('flip');
//   });

//   $('.change-vote').click(function (){
//   // $.post($(this).attr('action'), $(this).serialize(), null, "script");
//      console.log('got it here unflip');
//      thing = this;
//      $(this.parentNode.parentNode.parentNode).removeClass('flip');
//   });

//   $(window).on ("scroll", function (){
//     $('.edit_celebrity').submit(function (){
//       console.log('flipping');
//       $(this.parentNode.parentNode).addClass('flip');
//     });
//
//     $('.change-vote').click(function (){
//       thing = this;
//       $(this.parentNode.parentNode.parentNode).removeClass('flip');
//     });
     //window.graph_data = #{celebrity.graph_data}
 //    $('.chart').appear(function(){
 //    console.log('about to graph')
 //    chart_width = $('.chart').width();
 //    d3.select(".chart")
 //      .selectAll("div")
 //      .data(graph_data)
 //      .enter().append("div")
 //      .style("width", function(d) { return Math.max(d * chart_width, 25) + "px"; })
 //      .text(function(d) { return d*100 + '%'; });
 //  });
 //  });


   $(document).ajaxError(function (e, xhr, settings) {
        if (xhr.status == 401) {
          window.location.replace("/users/sign_up");
        }
    });

});
