# Validation Form
$('#form_contact').isHappy(
  fields:
    '#Field1':
        required: true
        message: 'Informe seu nome completo.'

    '#Field2':
      required: true
      message: 'Informe seu email corretos.'
      test: happy.email

    '#Field4':
        required: true
        message: 'Informe seu Skype ou telefone.'

    '#Field5':
        required: true
        message: 'Mensagem muito curta, nos explique melhor o seu projeto.'
        minlength: 3
)

$("#Field2").autoEmail(
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
