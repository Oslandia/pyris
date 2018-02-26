// Pyris map


// Address autocomplete with typeahead and the French address API
$(document).ready(function() {
  var $input = $('.typeahead');
  $input.typeahead({
    minLength: 3,
    source: function(query, resp) {
      $.ajax({
        url: 'https://api-adresse.data.gouv.fr/search/',
        dataType: 'json',
        data: {
          q: $('#address_search').val(),
          limit: 5
        },
        success: function(data) {
          resp($.map(data.features, function(feature) {
            return feature.properties.label;
          }));
        }});
    }});
} );


// When you click on the search address button.
function addressEvent(map) {
  var address_selected = document.getElementById("address_search").textContent;
  console.log(address_selected);
  $.ajax({
    url: 'https://api-adresse.data.gouv.fr/search/',
    dataType: 'json',
    data: {
      q: address_selected,
      limit: 1
    },
    success: function(data) {
      // console.log(data);
      updateMap(map, data.features[0]);
    }
  });
}

// single Leaflet marker
var marker;

function updateMap(map, feature) {
  // console.log(feature);
  // console.log(feature.geometry.coordinates);
  var coords = feature.geometry.coordinates.reverse();
  if (marker) {
    map.removeLayer(marker);
  }
  marker = L.marker(coords);
  marker.addTo(map);
  map.flyTo(coords, 14);
}


// Leaflet Map
$(document).ready(function() {
  var search_button = document.getElementById('bsearch');
  var map = L.map("Map").setView([47.5, 2], 6);
  // currying addressEvent function
  search_button.onclick = function() {
    return addressEvent(map);
  };
  var OSM_Mapnik = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  });
  OSM_Mapnik.addTo(map);
} );
