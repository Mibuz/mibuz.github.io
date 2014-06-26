#global $
(happyJS = ($) ->
  trim = (el) ->
    (if ("".trim) then el.val().trim() else $.trim(el.val()))
  $.fn.isHappy = isHappy = (config) ->
    isFunction = (obj) ->
      !!(obj and obj.constructor and obj.call and obj.apply)
    defaultError = (error) -> #Default error template
      msgErrorClass = config.classes and config.classes.message or "unhappyMessage"
      $ "<span id=\"" + error.id + "\" class=\"" + msgErrorClass + "\" role=\"alert\">" + error.message + "</span>"
    getError = (error) -> #Generate error html from either config or default
      return config.errorTemplate(error)  if isFunction(config.errorTemplate)
      defaultError error
    handleSubmit = ->
      i = undefined
      l = undefined
      errors = false
      i = 0
      l = fields.length

      while i < l
        errors = true  unless fields[i].testValid(true)
        i += 1
      if errors
        config.unHappy()  if isFunction(config.unHappy)
        return false
      else if config.testMode
        config.happy()  if isFunction(config.happy)
        console.warn "would have submitted"  if window.console
        return false
      config.happy()  if isFunction(config.happy)
      return
    handleMouseUp = ->
      pauseMessages = false
      return
    handleMouseDown = ->
      pauseMessages = true
      $(window).bind "mouseup", handleMouseUp
      return
    processField = (opts, selector) ->
      field = $(selector)
      error =
        message: opts.message or ""
        id: selector.slice(1) + "_unhappy"

      errorEl = (if $(error.id).length > 0 then $(error.id) else getError(error))
      handleBlur = handleBlur = ->
        unless pauseMessages
          field.testValid()
        else
          $(window).bind "mouseup", field.testValid.bind(this)
        return

      fields.push field
      field.testValid = testValid = (submit) ->
        val = undefined
        gotFunc = undefined
        temp = undefined
        el = $(this)
        error = false
        required = !!el.get(0).attributes.getNamedItem("required") or opts.required
        password = (field.attr("type") is "password")
        arg = (if isFunction(opts.arg) then opts.arg() else opts.arg)
        fieldErrorClass = config.classes and config.classes.field or "unhappy"

        # clean it or trim it
        if isFunction(opts.clean)
          val = opts.clean(el.val())
        else if not password and typeof opts.trim is "undefined" or opts.trim
          val = trim(el)
        else
          val = el.val()

        # write it back to the field
        el.val val

        # get the value
        gotFunc = ((val.length > 0 or required is "sometimes") and isFunction(opts.test))

        # check if we've got an error on our hands
        if submit is true and required is true and val.length is 0
          error = true
        else error = not opts.test(val, arg)  if gotFunc
        if error
          el.addClass(fieldErrorClass).after errorEl
          false
        else
          temp = errorEl.get(0)

          # this is for zepto
          temp.parentNode.removeChild temp  if temp.parentNode
          el.removeClass fieldErrorClass
          true

      field.bind opts.when or config.when or "blur", handleBlur
      return
    fields = []
    item = undefined
    pauseMessages = false
    for item of config.fields
      processField config.fields[item], item
    $(config.submitButton or this).bind "mousedown", handleMouseDown
    if config.submitButton
      $(config.submitButton).click handleSubmit
    else
      @bind "submit", handleSubmit
    this

  return
) @jQuery or @Zepto
