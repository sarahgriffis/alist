$( document ).ready(function() {
  if ($('#infinite-scrolling').size() > 0) {
    $(window).on ("scroll", function() {
      more_posts_url = $('.pagination .next_page').attr('href');
      console.log(more_posts_url)
      if (more_posts_url && $(window).scrollTop() <= $(document).height() - $(window).height() - 50){
      //if ($win.height() + $win.scrollTop() > (getDocumentHeight()-10))
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript(more_posts_url)
        return
      };
    });
    return
  };

  $(document).ajaxError(function (e, xhr, settings) {
    if (xhr.status == 401) {
      window.location.replace("/users/sign_up");
    }
  });
});
