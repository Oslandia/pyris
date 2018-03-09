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
// GeoJSON polygon
var layer;

function updateMap(map, feature) {
  // console.log(feature);
  // console.log(feature.geometry.coordinates);
  var coords = feature.geometry.coordinates.reverse();
  $.ajax({
    url: '/api/coords',
    dataType: 'json',
    data: {
      lat: coords[0],
      lon: coords[1],
      geojson: true
    },
    success: function(data) {
      // console.log(data);
      addGeoJSONLayer(map, data);
    }
  });
  if (marker) {
    map.removeLayer(marker);
  }
  marker = L.marker(coords);
  marker.addTo(map);
  map.flyTo(coords, 14);
}

function addGeoJSONLayer(map, feature) {
  if (layer) {
    map.removeLayer(layer);
  }
  layer = L.geoJSON(feature);
  layer.bindPopup("<ul><li><b>City</b>: " + feature.properties.city
                  + "</li><li><b>Citycode</b>: " + feature.properties.citycode + "</li>"
                  + "<li><b>Name</b>: " + feature.properties.name + "</li>"
                  + "<li><b>Type</b>: " + feature.properties.type + "</li>"
                  + "<li><b>Iris</b>: " + feature.properties.iris + "</li>"
                  + "</ul>" + "<b>Click to get more info!</b>")
    .on('mouseover', function(e) {
      this.openPopup();
    })
    .on('mouseout', function(e) {
      this.closePopup();
    })
    .on('click', function(e) {
      window.location.assign("/iris/" + feature.properties.citycode + feature.properties.iris);
    });
  layer.addTo(map);
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
