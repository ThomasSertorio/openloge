function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}

function onPlaceChanged() {
  var place = this.getPlace();
  console.log('in da stuff')

  console.log(place);  // Uncomment this line to view the full object returned by Google API.

  var lat = place.geometry.location.lat();
  var lng = place.geometry.location.lng();

  var type_element = document.getElementById("latitude");
  type_element.value = lat;

  var type_element = document.getElementById("longitude");
  type_element.value = lng;

  // for (var i in place.address_components) {
  //   var component = place.address_components[i];
  //   for (var j in component.types) {  // Some types are ["country", "political"]
  //     var type_element = document.getElementById(component.types[j]);
  //     if (type_element) {
  //       type_element.value = component.long_name;
  //     }
  //   }
  // }
}

google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('user_input_autocomplete_address');
});
