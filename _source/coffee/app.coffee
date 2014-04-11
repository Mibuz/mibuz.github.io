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

  ParallaxScroll : ->
    $('[data-parallax-speed]').each ->
      $obj = $(@);

      $(window).scroll ->
        yPos = ($(window).scrollTop() / $obj.data('parallax-speed'))

        bgpos = "50% #{ yPos }px"

        $obj.css('background-position', bgpos )

app = new App()
app.ParallaxScroll()

$('.scroll-to').on 'click', (e) ->
  e.preventDefault()
  app.smoothScroll $(window), $($(@).attr('href')).offset().top
