class App

  smoothScroll: (el, to, duration) ->
    @mover = 10
    duration = if duration < 0 || typeof duration != 'undefined' then duration else 800

    difference = to - $(window).scrollTop()
    perTick = difference / duration * @mover

    setTimeout((->
      unless isNaN(parseInt(perTick, @mover))
        window.scrollTo 0, $(window).scrollTop() + perTick
        @smoothScroll el, to, duration - @mover
    ).bind(this), @mover)

mibuz = new App()

$('.scroll-to').on 'click', (e) ->
  e.preventDefault()
  mibuz.smoothScroll $(window), $($(@).attr('href')).offset().top
