class @Parallax extends @App
  constructor: ()->
    @background()

  scrolling: (el, to, duration) ->
    duration: 500
    $(el).animate
      scrollTop: to
    , duration

  background: ->
    if !@isMobile()
      $('[data-parallax-speed]').each ->
        $obj = $(@)
        offset = parseInt($obj.css('background-position-y'))

        $(window).scroll ->
          yPos = ($(window).scrollTop() / $obj.data('parallax-speed')) + offset
          bgpos = "50% #{ yPos }px"
          $obj.css('background-position', bgpos )

parallax = new Parallax()

$('.scroll-to, .menu ul li a').on 'click', (e) ->
  e.preventDefault()
  parallax.scrolling 'body', $($(@).attr('href')).offset().top
