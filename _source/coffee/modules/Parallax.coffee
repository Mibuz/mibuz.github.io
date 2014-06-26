class @Parallax extends @App
  constructor: ()->
    @background()

  scrolling: (el, to, duration) ->
    @mover = 8
    duration = if duration < 0 || typeof duration != 'undefined' then duration else 800

    difference = to - $(window).scrollTop()
    perTick = difference / duration * @mover

    setTimeout((->
      unless isNaN(parseInt(perTick, @mover))
        window.scrollTo 0, $(window).scrollTop() + perTick
        @scrolling el, to, duration - @mover
    ).bind(this), @mover)

  background: ->
    if !@isMobile()
      $('[data-parallax-speed]').each ->
        $obj = $(@);

        $(window).scroll ->
          yPos = ($(window).scrollTop() / $obj.data('parallax-speed'))
          bgpos = "50% #{ yPos }px"
          $obj.css('background-position', bgpos )

parallax = new Parallax()

$('.scroll-to').on 'click', (e) ->
  e.preventDefault()
  parallax.scrolling $(window), $($(@).attr('href')).offset().top
