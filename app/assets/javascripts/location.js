var directionsDisplay;
var directionsService = new google.maps.DirectionsService();

function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var latitude = $("#map-canvas").data("latitude");
  var longitude = $("#map-canvas").data("longitude");

  var mapOptions = {
    zoom: 13,
    center: new google.maps.LatLng(latitude, longitude)
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('directions-panel'));

  parkings(map);
};


function parkings(map){
  var parkings = $("#map-canvas").data("parkings");
  for(var i=0; i < parkings.length; i++){
    addMarker(map,parkings[i].lat,parkings[i].lng);
  };
};


function addMarker(map,lat,lng){
  var image = "../assets/parking-icon.png";
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat,lng),
    map:map,
    icon:image
  })
}

$(document).ready(initialize);
