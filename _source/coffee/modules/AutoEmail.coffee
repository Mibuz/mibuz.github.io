(($) ->
  $.fn.autoEmail = (domains, multi) ->
    @each ->
      $this = $(this)
      len = undefined
      domain = domains[0]

      # check for autocomplete after each key
      $this.keypress (e) ->
        keyCode = (if e.keyCode then e.keyCode else (if e.which then e.which else e.charCode))

        # FireFox needs you to watch for action keys (arrows, tab, etc.)
        protectedKeyCodes = [
          8
          9
          17
          18
          35
          36
          37
          38
          39
          40
          45
        ]
        return  if protectedKeyCodes.indexOf(keyCode) >= 0
        e.preventDefault()

        # save selection start for later
        selStart = $(this)[0].selectionStart
        selEnd = $(this)[0].selectionEnd
        len = $(this).val().length

        # add separator with space comma after completion key space is pressed
        # comma, semicolon, and enter are valid completion keys
        if /^(13|44|59)$/.test("" + keyCode)

          # if multi-enabled, separate emails with a separator
          if multi
            separator = undefined
            unless selStart is selEnd

              # user is autocompleting, so pad separator
              if keyCode is 59
                separator = "; "
              else
                separator = ", "

            # user is just typing another separator; don't fight it
            else separator = String.fromCharCode(keyCode)  unless keyCode is 13

            # insert separator if it exists
            $this.val $this.val().substr(0, selEnd) + separator + $this.val().substr(selEnd, $this.val().length)  if separator?

          # move cursor
          $this[0].selectionStart = selEnd + ($this.val().length - len)
          $this[0].selectionEnd = selEnd + ($this.val().length - len)
          return

        # replace selection range with typed character
        $this.val $this.val().substr(0, selStart) + String.fromCharCode(keyCode) + $this.val().substr(selEnd, $this.val().length)
        len = $(this).val().length - len

        # fix selection
        $this[0].selectionStart = ++selStart
        $this[0].selectionEnd = selEnd + len

        # get substring to try appending with autocomplete email
        emailsDirty = $(this).val().substr(0, selStart).split("@")
        return  if emailsDirty.length < 2 or emailsDirty[0] is ""
        emailDomain = emailsDirty[emailsDirty.length - 1]

        # get all possible domain matches
        matches = $.grep(domains, (el, index) ->

          # First part of emailDomain should match first part of domain
          emailDomain is el.substr(0, emailDomain.length)
        )
        if matches.length > 0

          # take first domain match for autocomplete
          subStr = matches[0].substr(emailDomain.length, matches[0].length)
          $this.val $this.val().substr(0, selStart) + subStr + $this.val().substr(selStart, $this.val().length)

          # highlight autocompleted text
          $this[0].selectionStart = selStart
          $this[0].selectionEnd = selStart + subStr.length
        return

      return

  return
) jQuery
