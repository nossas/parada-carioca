$(function(){
  $("select[name='by_neighborhood']").select2({width:"300px"});
  $('img').qtip();
  $("#activity_price").maskMoney({allowZero: true});

  if(document.getElementById('activity_address')){
    var mapOptions    = { center: new google.maps.LatLng(-22.90385,-43.210113), zoom: 13, mapTypeId: google.maps.MapTypeId.ROADMAP };
    var map           = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
    var input         = document.getElementById('activity_address');
    var autocomplete  = new google.maps.places.Autocomplete(input);
    var infowindow    = new google.maps.InfoWindow();
    var marker        = new google.maps.Marker({ map: map });
  
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
      $("#activity_latitude").val(place.geometry.location.$a);
      $("#activity_longitude").val(place.geometry.location.ab);
  
      // If the place has a geometry, then present it on a map.
      if (place.geometry.viewport) {
        map.fitBounds(place.geometry.viewport);
      } else {
        map.setCenter(place.geometry.location);
        map.setZoom(17);  // Why 17? Because it looks good.
      }
      var image = new google.maps.MarkerImage(
        place.icon,
        new google.maps.Size(71, 71),
        new google.maps.Point(0, 0),
        new google.maps.Point(17, 34),
        new google.maps.Size(35, 35));
        marker.setIcon(image);
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
});
