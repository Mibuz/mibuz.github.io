class App

  isMobile: ->
    navigator.userAgent.match(/Android|BlackBerry|iPhone|iPad|iPod|Opera Mini|IEMobile/i)

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
    if !app.isMobile()
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

# Validation Form
$('#form_contact').isHappy(
  fields:
    '#Field1':
        required: true,
        message: 'Informe seu nome completo.'

    '#Field2':
      required: true,
      message: 'Informe seu email correto.',
      test: happy.email

    '#Field4':
        required: true,
        message: 'Informe seu Skype ou telefone.'

    '#Field5':
        required: true,
        message: 'Mensagem muito curta, nos explique melhor o seu projeto.'
        minlength: 3
)

$("#Field2").autoEmail(['gmail.com', 'yahoo.com', 'google.com', 'hotmail.com', 'me.com', 'aol.com', 'live.com', 'googlemail.com', 'msn.com', 'facebook.com', 'mail.com', 'outlook.com', 'icloud.com'], false)
