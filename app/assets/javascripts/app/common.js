App = window.App = {
  Common: {
    init: function(){    
      this.loadLibraries();
      this.initializeSocialButtons();

    },

    loadLibraries: function(){
      $('.datepicker').datetimepicker({ dateFormat: "dd/mm/yy", minDate: new Date() });
      $('*[class=price]').maskMoney({ allowZero: true });
      $('*[class=price]').mask({ allowZero: true });
      $(".select2").select2({ width: "300px" });
      $('.tip').qtip();
      $('[rel*=facebox]').facebox();

    },

    initializeSocialButtons: function(){
      (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=329953690444851";
        fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
      !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
    }
  }
}
