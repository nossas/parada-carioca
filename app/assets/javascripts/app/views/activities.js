App.Activities = {
  New: Backbone.View.extend({
    el: 'body',
    events: {
      'keypress #activity_address' : 'selectAddress'
    },

    initialize: function(){
      this.latitude   = this.$('#activity_latitude');
      this.longitude  = this.$('#activity_longitude');
      this.address    = this.$('#activity_address')[0];
      this.canvas     = this.$('#map_canvas')[0];


      if (this.latitude.val() != '' && this.longitude.val() != '') {
        var lat = this.latitude.val();
        var lng = this.longitude.val();
      } else {
        var lat = -22.90385;
        var lng = -43.210113;
      }

      this.loadGoogleMaps({
        address:  this.address, 
        canvas:   this.canvas, 
        lat:      lat, 
        lng:      lng, 
        zoom:     16
      });  
    },


    selectAddress: function(event){
      return event.keyCode == 13 ? false : true
    },

    loadGoogleMaps: function(input){
      var myLatLng      = new google.maps.LatLng(input.lat, input.lng);
      var mapOptions    = { center: myLatLng, zoom: input.zoom, mapTypeId: google.maps.MapTypeId.ROADMAP };
      var map           = new google.maps.Map(input.canvas, mapOptions);
      var input         = input.address
      var autocomplete  = new google.maps.places.Autocomplete(input);
      var infowindow    = new google.maps.InfoWindow();
      var marker        = new google.maps.Marker({ map: map, position: myLatLng });
      var self          = this;

      autocomplete.bindTo('bounds', map);

      google.maps.event.addListener(autocomplete, 'place_changed', function() {
        infowindow.close();
        marker.setVisible(true);
        input.className = '';
        var place = autocomplete.getPlace();
        if (!place.geometry) {
          // Inform the user that the place was not found and return.
          input.className = 'notfound';
          return;
        }

        console.log(place.geometry);
        self.latitude.val(place.geometry.location.Ya);
        self.longitude.val(place.geometry.location.Za);

        // If the place has a geometry, then present it on a map.
        if (place.geometry.viewport) {
          map.fitBounds(place.geometry.viewport);
        } else {
          map.setCenter(place.geometry.location);
          map.setZoom(17);  // Why 17? Because it looks good.
        }

        marker.setPosition(place.geometry.location);

        var address = '';
        if (place.address_components) {
          address = [
            (place.address_components[0] && place.address_components[0].short_name || ''),
            (place.address_components[1] && place.address_components[1].short_name || ''),
            (place.address_components[2] && place.address_components[2].short_name || '')
          ].join(' ');
        }
        infowindow.setPosition(place.geometry.location);
        infowindow.setContent('<strong>' + place.name + '</strong><br>' + address);
        infowindow.open(map);
      });
    }
  }),
  Show: Backbone.View.extend({
    el: 'body',
    initialize: function(){
      $("form.new_participation input[type='submit']").hide();
      $("form.new_participation input[type='radio']").change(function(){ $("form.new_participation input[type='submit']").show(); });
      $("form#new_review").hide();
      $("a[href='#new_review']").click(function(){$("form#new_review").slideDown(); return false;});
      $("form#new_review input[type='submit']").attr("disabled", "disabled")
      $("#review_description").keyup(function(){
        if($("#review_description").val().length > 0){
          $("form#new_review input[type='submit']").removeAttr("disabled");
        } else {
          $("form#new_review input[type='submit']").attr("disabled", "disabled")
        }
      });
    }
  })
};
App.Activities.Router = Backbone.Router.extend({

  routes: {
    ":page" : 'showBlock',
  },

  showBlock: function(page) { 
    var el    = $('.' + page);
    var link  = $('a.' + page);

    $('.item').addClass('hidden');
    el.removeClass('hidden').animate({ marginTop: 0 }, 200)
    $('.menu a').removeClass('selected');
    link.addClass('selected'); 
    $('.hidden').addClass('not_active').animate({ marginTop: "-400px"}, 30);
  }
});


App.Activities.Edit = App.Activities.New.extend({
  el: 'body',


  events: function(){
    return this.constructor.__super__.events;
  },


  initialize: function(){
    this.$('#create_event').hide();



    // Binding routes
    new App.Activities.Router();
    Backbone.history.start();

    // Inheritance from parent View
    App.Activities.New.prototype.initialize.apply(this);

    // Initializing the calendar
    this.calendar = this.$('#calendar');


    // Initializing the fullCalendar plugin
    // It is not active yet.
    //this.showCalendarWithEvents(this.calendar);
  },

  showCalendarWithEvents: function(target, evts) {
    var self = this;
    target.fullCalendar({ 
      events: self.calendar.data('url'), 
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      defaultView: 'month',
    }); 
  },

});


App.Activities.Create = App.Activities.New.extend();
