(function(){var a,b,c,d={}.hasOwnProperty,e=function(a,b){function c(){this.constructor=a}for(var e in b)d.call(b,e)&&(a[e]=b[e]);return c.prototype=b.prototype,a.prototype=new c,a.__super__=b.prototype,a};this.App=function(){function a(){this.isMobile()}return a.prototype.isMobile=function(){return navigator.userAgent.match(/Android|BlackBerry|iPhone|iPad|iPod|Opera Mini|IEMobile/i)},a}(),function(a){a.fn.autoEmail=function(b,c){return this.each(function(){var d,e,f;d=a(this),f=void 0,e=b[0],d.keypress(function(e){var g,h,i,j,k,l,m,n,o;if(i=e.keyCode?e.keyCode:e.which?e.which:e.charCode,k=[8,9,17,18,35,36,37,38,39,40,45],!(k.indexOf(i)>=0)){if(e.preventDefault(),m=a(this)[0].selectionStart,l=a(this)[0].selectionEnd,f=a(this).val().length,/^(13|44|59)$/.test(""+i))return c&&(n=void 0,m!==l?n=59===i?"; ":", ":13!==i&&(n=String.fromCharCode(i)),null!=n&&d.val(d.val().substr(0,l)+n+d.val().substr(l,d.val().length))),d[0].selectionStart=l+(d.val().length-f),void(d[0].selectionEnd=l+(d.val().length-f));d.val(d.val().substr(0,m)+String.fromCharCode(i)+d.val().substr(l,d.val().length)),f=a(this).val().length-f,d[0].selectionStart=++m,d[0].selectionEnd=l+f,h=a(this).val().substr(0,m).split("@"),h.length<2||""===h[0]||(g=h[h.length-1],j=a.grep(b,function(a){return g===a.substr(0,g.length)}),j.length>0&&(o=j[0].substr(g.length,j[0].length),d.val(d.val().substr(0,m)+o+d.val().substr(m,d.val().length)),d[0].selectionStart=m,d[0].selectionEnd=m+o.length))}})})}}(jQuery),(b=function(a){var b,c;c=function(b){return"".trim?b.val().trim():a.trim(b.val())},a.fn.isHappy=b=function(b){var d,e,f,g,h,i,j,k,l,m;j=function(a){return!!(a&&a.constructor&&a.call&&a.apply)},d=function(c){var d;return d=b.classes&&b.classes.message||"unhappyMessage",a('<span id="'+c.id+'" class="'+d+'" role="alert">'+c.message+"</span>")},f=function(a){return j(b.errorTemplate)?b.errorTemplate(a):d(a)},i=function(){var a,c,d;for(c=void 0,d=void 0,a=!1,c=0,d=e.length;d>c;)e[c].testValid(!0)||(a=!0),c+=1;return a?(j(b.unHappy)&&b.unHappy(),!1):b.testMode?(j(b.happy)&&b.happy(),window.console&&console.warn("would have submitted"),!1):void(j(b.happy)&&b.happy())},h=function(){var a;a=!1},g=function(){var b;b=!0,a(window).bind("mouseup",h)},m=function(d,g){var h,i,k,m,n;k=a(g),h={message:d.message||"",id:g.slice(1)+"_unhappy"},i=a(h.id).length>0?a(h.id):f(h),m=m=function(){l?a(window).bind("mouseup",k.testValid.bind(this)):k.testValid()},e.push(k),k.testValid=n=function(e){var f,g,l,m,n,o,p,q;return q=void 0,m=void 0,p=void 0,g=a(this),h=!1,o=!!g.get(0).attributes.getNamedItem("required")||d.required,n="password"===k.attr("type"),f=j(d.arg)?d.arg():d.arg,l=b.classes&&b.classes.field||"unhappy",q=j(d.clean)?d.clean(g.val()):!n&&"undefined"==typeof d.trim||d.trim?c(g):g.val(),g.val(q),m=(q.length>0||"sometimes"===o)&&j(d.test),e===!0&&o===!0&&0===q.length?h=!0:m&&(h=!d.test(q,f)),h?(g.addClass(l).after(i),!1):(p=i.get(0),p.parentNode&&p.parentNode.removeChild(p),g.removeClass(l),!0)},k.bind(d.when||b.when||"blur",m)},e=[],k=void 0,l=!1;for(k in b.fields)m(b.fields[k],k);return a(b.submitButton||this).bind("mousedown",g),b.submitButton?a(b.submitButton).click(i):this.bind("submit",i),this}})(this.jQuery||this.Zepto),a={USPhone:function(a){return/^\(?(\d{3})\)?[\- ]?\d{3}[\- ]?\d{4}$/.test(a)},date:function(a){return/^(?:0[1-9]|1[0-2])\/(?:0[1-9]|[12][0-9]|3[01])\/(?:\d{4})/.test(a)},email:function(a){return/^(?:\w+\.?\+?)*\w+@(?:\w+\.)+\w+$/.test(a)},minLength:function(a,b){return a.length>=b},maxLength:function(a,b){return a.length<=b},equal:function(a,b){return a===b}},this.Parallax=function(a){function b(){this.background()}return e(b,a),b.prototype.scrolling=function(a,b,c){return $(a).animate({scrollTop:b},c)},b.prototype.background=function(){return this.isMobile()?void 0:$("[data-parallax-speed]").each(function(){var a,b;return a=$(this),b=parseInt(a.css("background-position-y")),$(window).scroll(function(){var c,d;return d=$(window).scrollTop()/a.data("parallax-speed")+b,c="50% "+d+"px",a.css("background-position",c)})})},b}(this.App),c=new Parallax,$(".scroll-to, .menu ul li a").on("click",function(a){return a.preventDefault(),c.scrolling("body",$($(this).attr("href")).offset().top)}),$("#contact form").isHappy({fields:{".name":{required:!0,message:"Informe seu nome completo."},".email":{required:!0,message:"Informe seu email corretos.",test:a.email},".phone":{required:!0,message:"Informe seu Skype ou telefone."},".message":{required:!0,message:"Mensagem muito curta, nos explique melhor o seu projeto.",minlength:3}}}),$(".field.email").autoEmail(["gmail.com","yahoo.com","google.com","hotmail.com","me.com","aol.com","live.com","googlemail.com","msn.com","facebook.com","mail.com","outlook.com","icloud.com"],!1),$("#contact form").on("submit",function(a){return $.ajax({type:"POST",url:"http://localhost:3000/api/v1/entries",data:$(this).serializeArray(),success:function(a){return console.log(a)},error:function(a){return console.log(a.responseText)}}),a.preventDefault()})}).call(this);