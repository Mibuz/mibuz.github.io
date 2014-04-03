smoothScroll = (el, to, duration) ->
  return  if duration < 0
  difference = to - $(window).scrollTop()
  perTick = difference / duration * 10
  @scrollToTimerCache = setTimeout((->
    unless isNaN(parseInt(perTick, 10))
      window.scrollTo 0, $(window).scrollTop() + perTick
      smoothScroll el, to, duration - 10
    return
  ).bind(this), 10)

$('.scroll-to').on 'click', (e) ->
  e.preventDefault()
  smoothScroll $(window), $($(e.currentTarget).attr('href')).offset().top, 500
