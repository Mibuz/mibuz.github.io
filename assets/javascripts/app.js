(function() {
  var App, app;

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

    App.prototype.ParallaxScroll = function() {
      return $('[data-parallax-speed]').each(function() {
        var $obj;
        $obj = $(this);
        return $(window).scroll(function() {
          var bgpos, yPos;
          yPos = $(window).scrollTop() / $obj.data('parallax-speed');
          bgpos = "50% " + yPos + "px";
          return $obj.css('background-position', bgpos);
        });
      });
    };

    return App;

  })();

  app = new App();

  app.ParallaxScroll();

  $('.scroll-to').on('click', function(e) {
    e.preventDefault();
    return app.smoothScroll($(window), $($(this).attr('href')).offset().top);
  });

}).call(this);
