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


$("#contact form").on 'submit', (e)->

  $.ajax
    type: "POST"
    url: "http://localhost:3000/api/v1/entries"
    data: $(@).serializeArray()

    success: (response) ->
      console.log response

    error: (xhr, ajaxOptions, thrownError) ->
      console.log xhr.responseText

  e.preventDefault()