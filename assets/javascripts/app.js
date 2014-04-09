(function() {
  var App, mibuz;

  App = (function() {
    function App() {}

    App.prototype.smoothScroll = function(el, to, duration) {
      var difference, perTick;
      this.mover = 10;
      duration = duration < 0 || typeof duration !== 'undefined' ? duration : 800;
      difference = to - $(window).scrollTop();
      perTick = difference / duration * this.mover;
      return setTimeout((function() {
        if (!isNaN(parseInt(perTick, this.mover))) {
          window.scrollTo(0, $(window).scrollTop() + perTick);
          return this.smoothScroll(el, to, duration - this.mover);
        }
      }).bind(this), this.mover);
    };

    return App;

  })();

  mibuz = new App();

  $('.scroll-to').on('click', function(e) {
    e.preventDefault();
    return mibuz.smoothScroll($(window), $($(this).attr('href')).offset().top);
  });

}).call(this);
