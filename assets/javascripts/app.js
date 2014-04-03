(function() {
  var smoothScroll;

  smoothScroll = function(el, to, duration) {
    var difference, perTick;
    if (duration < 0) {
      return;
    }
    difference = to - $(window).scrollTop();
    perTick = difference / duration * 10;
    return this.scrollToTimerCache = setTimeout((function() {
      if (!isNaN(parseInt(perTick, 10))) {
        window.scrollTo(0, $(window).scrollTop() + perTick);
        smoothScroll(el, to, duration - 10);
      }
    }).bind(this), 10);
  };

  $('.scroll-to').on('click', function(e) {
    e.preventDefault();
    return smoothScroll($(window), $($(this).attr('href')).offset().top, 500);
  });

}).call(this);
