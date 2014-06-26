class @App
  constructor: ()->
    @isMobile()

  isMobile: ->
    navigator.userAgent.match(/Android|BlackBerry|iPhone|iPad|iPod|Opera Mini|IEMobile/i)
