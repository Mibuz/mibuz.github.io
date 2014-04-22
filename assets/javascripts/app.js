(function() {
  var App, app;

  App = (function() {
    function App() {}

    App.prototype.isMobile = {
      Android: function() {
        return navigator.userAgent.match(/Android/i);
      },
      BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
      },
      iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
      },
      Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
      },
      Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
      },
      any: function() {
        return this.Android() || this.BlackBerry() || this.iOS() || this.Opera() || this.Windows();
      }
    };

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
      if (!app.isMobile.any()) {
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
      }
    };

    return App;

  })();

  app = new App();

  app.ParallaxScroll();

  $('.scroll-to').on('click', function(e) {
    e.preventDefault();
    return app.smoothScroll($(window), $($(this).attr('href')).offset().top);
  });

  $('#form_contact').isHappy({
    fields: {
      '#Field1': {
        required: true,
        message: 'Informe seu nome completo.'
      },
      '#Field2': {
        required: true,
        message: 'Informe seu email correto.',
        test: happy.email
      },
      '#Field4': {
        required: true,
        message: 'Informe seu Skype ou telefone.'
      },
      '#Field5': {
        required: true,
        message: 'Mensagem muito curta, nos explique melhor o seu projeto.',
        minlength: 3
      }
    }
  });

  $("#Field2").autoEmail(['gmail.com', 'yahoo.com', 'google.com', 'hotmail.com', 'me.com', 'aol.com', 'live.com', 'googlemail.com', 'msn.com', 'facebook.com', 'mail.com', 'outlook.com', 'icloud.com'], false);

}).call(this);
