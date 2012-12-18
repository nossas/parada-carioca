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
        zoom:     13
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
        marker.setVisible(false);
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
        marker.setIcon(null);
        marker.setPosition(place.geometry.location);

        var address = '';
        if (place.address_components) {
          address = [
            (place.address_components[0] && place.address_components[0].short_name || ''),
            (place.address_components[1] && place.address_components[1].short_name || ''),
            (place.address_components[2] && place.address_components[2].short_name || '')
          ].join(' ');
        }

        infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
        infowindow.open(map, marker);
      });
    }
  })
};

App.Activities.Edit = App.Activities.New.extend({
  el: 'body',

  events: _.extend({
    'reveal.facebox' : 'validateDateField',
  }, App.Activities.New.prototype.events),

  initialize: function(){
    this.$('#create_event').hide();
    this.validateDateField();
    App.Activities.New.prototype.initialize.apply(this);


  },

  validateDateField: function(){
    this.$("#new_event").validate({
      messages: {
        "event[date]": {required: "escolha uma data para a realização do evento"}
      }
    });
  },
});


App.Activities.Create = App.Activities.New.extend();
