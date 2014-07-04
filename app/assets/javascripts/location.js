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
  });


function onClickEvent(event, marker , map) { 
  var latitude = marker.position.lat(); 
  var longitude = marker.position.lng(); 
  var end = latitude.toString() + " " + longitude.toString();

  $.getJSON('http://freegeoip.net/json/', function(json){
    var myIp = json;
    var start = myIp.latitude.toString() + " " + myIp.longitude.toString();
    calcRoute(start,end);
  });

};

function calcRoute(start,end) {
  var request = {
    origin:start,
    destination:end,
    travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}; 


google.maps.event.addListener(marker, 'click', function() { 
  map.setCenter(new google.maps.LatLng(marker.position.lat(), marker.position.lng())); 
    // map.setZoom(18); 
    onClickEvent(event, marker,map); 
  }); 
}; 


$(document).ready(initialize);
