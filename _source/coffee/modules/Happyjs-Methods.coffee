happy =
  USPhone: (val) ->
    /^\(?(\d{3})\)?[\- ]?\d{3}[\- ]?\d{4}$/.test val

  date: (val) ->
    /^(?:0[1-9]|1[0-2])\/(?:0[1-9]|[12][0-9]|3[01])\/(?:\d{4})/.test val

  email: (val) ->
    /^(?:\w+\.?\+?)*\w+@(?:\w+\.)+\w+$/.test val

  minLength: (val, length) ->
    val.length >= length

  maxLength: (val, length) ->
    val.length <= length

  equal: (val1, val2) ->
    val1 is val2
