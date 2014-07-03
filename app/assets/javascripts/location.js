var directionsDisplay;
var directionsService = new google.maps.DirectionsService();

function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var latitude = $("#map-canvas").data("latitude");
  var longitude = $("#map-canvas").data("longitude");

  var mapOptions = {
    zoom: 14,
    center: new google.maps.LatLng(latitude, longitude)
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('directions-panel'));


}

$(document).ready(initialize);
