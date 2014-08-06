# Validation Form
$('#contact form').isHappy(
  fields:
    '.name':
        required: true
        message: 'Informe seu nome completo.'

    '.email':
      required: true
      message: 'Informe seu email corretos.'
      test: happy.email

    '.phone':
        required: true
        message: 'Informe seu Skype ou telefone.'

    '.message':
        required: true
        message: 'Mensagem muito curta, nos explique melhor o seu projeto.'
        minlength: 3
)

$(".field.email").autoEmail(
  [
    'gmail.com'
    'yahoo.com'
    'google.com'
    'hotmail.com'
    'me.com'
    'aol.com'
    'live.com'
    'googlemail.com'
    'msn.com'
    'facebook.com'
    'mail.com'
    'outlook.com'
    'icloud.com'
  ]
  false
  )

ajaxSuccess = (response) ->
  message = "Mensagem enviada com sucesso!"
  $("#contact .alert").removeClass('error').addClass('success').html(message)

ajaxError = (xhr, ajaxOptions, thrownError) ->
  message = "Algo errado aconteceu, vamos verificar. Enquanto isso, por favor, envie um email para contato@mibuz.com.br."
  $("#contact .alert").removeClass('success').addClass('error').html(message)

$("#contact form").on 'submit', (e)->

  $.ajax
    type: "POST"
    url: "http://localhost:3000/api/v1/entries"
    data: $(@).serializeArray()

    success: (response) ->
      ajaxSuccess(response)

    error: (xhr, ajaxOptions, thrownError) ->
      ajaxError(xhr, ajaxOptions, thrownError)

  e.preventDefault()
