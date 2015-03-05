# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  if $('#infinite-scrolling').size() > 0
    console.log('got to here')
    $(window).on 'scroll', ->
      more_posts_url = $('.pagination .next_page').attr('href')
      console.log(more_posts_url)
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 100
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript more_posts_url
      return
    return
