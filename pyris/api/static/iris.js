// Iris page


// Map close to the IRIS
function irisMap(map, data) {
  var OSM_Mapnik = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  });
  OSM_Mapnik.addTo(map);
  var centroid = turf.center(data);
  console.log(centroid);
  map.setView([centroid.geometry.coordinates[1],
               centroid.geometry.coordinates[0]], 14);
  layer = L.geoJSON(data);
  layer.bindPopup("<ul><li><b>City</b>: " + data.properties.city
                  + "</li><li><b>Citycode</b>: " + data.properties.citycode + "</li>"
                  + "<li><b>Name</b>: " + data.properties.name + "</li>"
                  + "<li><b>Type</b>: " + data.properties.type + "</li>"
                  + "<li><b>Iris</b>: " + data.properties.iris + "</li>" + "</ul>")
    .on('mouseover', function(e) {
      this.openPopup();
    })
    .on('mouseout', function(e) {
      this.closePopup();
    });
  layer.addTo(map);
};

// Leaflet Map
$(document).ready(function() {
  var iris_code = document.getElementById("irisMap").dataset.iris;
  var map = L.map("irisMap");
  $.get("/api/compiris/" + iris_code + "?geojson=true", function(data) {
      irisMap(map, data);
  } );
} );

// Population
$(document).ready(function() {
  var iris_code = document.getElementById("populationSex").dataset.iris;
  $.get("/api/insee/population/" + iris_code, function (content) {
    $("#population").append(Math.round(content.population));
    Highcharts.chart('populationSex', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Population'
      },
      yAxis: {
        title: {
          text: 'Population'
        }
      },
      xAxis: {
        categories: ['Female', 'Male'],
      },
      tooltip: {
        pointFormat: "Population: {point.y:.2f}"
      },
      series: [{
        "name": "population",
        "data": [content.population_female, content.population_male]
      }]
    } );
  } );
} );

// Population by age
$(document).ready(function() {
  var iris_code = document.getElementById("populationAge").dataset.iris;
  $.get("/api/insee/population/distribution/" + iris_code + "?by=age", function (content) {
    Highcharts.chart('populationAge', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Population by age'
      },
      yAxis: {
        title: {
          text: 'Population'
        }
      },
      xAxis: {
        categories: ['0-14', '15-29', '30-44', '45-59', '60,75', '>75'],
      },
      tooltip: {
        pointFormat: "Population: {point.y:.2f}"
      },
      series: [{
        "name": "population",
        "data": [content.data.population_0_14,
                 content.data.population_15_29,
                 content.data.population_30_44,
                 content.data.population_45_59,
                 content.data.population_60_74,
                 content.data.population_75]
      }]
    } );
  } );
} );


// Population by age and sex
$(document).ready(function() {
  var iris_code = document.getElementById("populationSex").dataset.iris;
  $.get("/api/insee/population/distribution/" + iris_code + "?by=sex", function (content) {
    Highcharts.chart('populationAgeSex', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Population by age and sex'
      },
      yAxis: {
        title: {
          text: 'Population'
        }
      },
      xAxis: {
        categories: ['0-14', '15-29', '30-44', '45-59', '60,75', '>75'],
      },
      tooltip: {
        pointFormat: "Population: {point.y:.2f}"
      },
      series: [{
        "name": "Female",
        "data": [content.data.female_0_14,
                 content.data.female_15_29,
                 content.data.female_30_44,
                 content.data.female_45_59,
                 content.data.female_60_74,
                 content.data.female_75]
      }, {
        "name": "Male",
        "data": [content.data.male_0_14,
                 content.data.male_15_29,
                 content.data.male_30_44,
                 content.data.male_45_59,
                 content.data.male_60_74,
                 content.data.male_75]
      }]
    } );
  } );
} );


// Logement by type
$(document).ready(function() {
  var iris_code = document.getElementById("logementType").dataset.iris;
  $.get("/api/insee/logement/" + iris_code , function (content) {
    Highcharts.chart('logementType', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Logement'
      },
      yAxis: {
        title: {
          text: 'Nombre de logements'
        }
      },
      xAxis: {
        type: "category"
      },
      tooltip: {
        pointFormat: "Logement: {point.y:.2f}"
      },
      series: [{
        name: "logement",
        colorByPoint: true,
        data: [{
          name: "total",
          y: content.logement
        }, {
          name: "house",
          y: content.house
        }, {
          name: "appartment",
          y: content.appartment
        }, {
          name: "main",
          y: content.main_residence
        }, {
          name: "second",
          y: content.second_residence
        }, {
          name: "unoccupied",
          y: content.unoccupied
        }]
      }]
    } );
  } );
} );

// Logement by year
$(document).ready(function() {
  var iris_code = document.getElementById("logementYear").dataset.iris;
  $.get("/api/insee/logement/distribution/" + iris_code + "?by=year" , function (content) {
    Highcharts.chart('logementYear', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Année de construction'
      },
      yAxis: {
        title: {
          text: 'Nombre de logements'
        }
      },
      xAxis: {
        categories: ['< 1919', '1920-1945', '1946-1970', '1971-1990', '1991-2005', '2006-2011'],
      },
      tooltip: {
        pointFormat: "Logement: {point.y:.2f}"
      },
      series: [{
        name: "logement",
        color: "#66c2a5",
        data: [
          content.data.main_residence_1919,
          content.data.main_residence_1920_1945,
          content.data.main_residence_1946_1970,
          content.data.main_residence_1971_1990,
          content.data.main_residence_1991_2005,
          content.data.main_residence_2006_2011]
      }]
    } );
  } );
} );

// Logement by room
$(document).ready(function() {
  var iris_code = document.getElementById("logementRoom").dataset.iris;
  $.get("/api/insee/logement/distribution/" + iris_code + "?by=room" , function (content) {
    Highcharts.chart('logementRoom', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Par nombre de pièces'
      },
      yAxis: {
        title: {
          text: 'Nombre de logements'
        }
      },
      xAxis: {
        categories: ['1 room', '2 room', '3 room', '4 room', '>5'],
      },
      tooltip: {
        pointFormat: "Logement: {point.y:.2f}"
      },
      series: [{
        name: "logement",
        color: "#fc8d62",
        data: [
          content.data.main_residence_1_room,
          content.data.main_residence_2_room,
          content.data.main_residence_3_room,
          content.data.main_residence_4_room,
          content.data.main_residence_5_room]
      }]
    } );
  } );
} );

// Logement by area
$(document).ready(function() {
  var iris_code = document.getElementById("logementArea").dataset.iris;
  $.get("/api/insee/logement/distribution/" + iris_code + "?by=area" , function (content) {
    Highcharts.chart('logementArea', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Surface'
      },
      yAxis: {
        title: {
          text: 'Nombre de logements'
        }
      },
      xAxis: {
        categories: ['<30m2', '30-40m2', '40-60m2', '60-80m2', '80-100m2', '100-120m2', '>120m2'],
      },
      tooltip: {
        pointFormat: "Logement: {point.y:.2f}"
      },
      series: [{
        name: "logement",
        color: "#8da0cb",
        data: [
          content.data.main_residence_30m2,
          content.data.main_residence_30_40m2,
          content.data.main_residence_40_60m2,
          content.data.main_residence_60_80m2,
          content.data.main_residence_80_100m2,
          content.data.main_residence_100_120m2,
          content.data.main_residence_120m2]
      }]
    } );
  } );
} );


// Actvite / employment
$(document).ready(function() {
  var iris_code = document.getElementById("employment").dataset.iris;
  $.get("/api/insee/activite/" + iris_code, function (content) {
    $("#emplPopulation").append(Math.round(content.population));
    $("#emplActif").append(Math.round(content.actif));
    $("#emplChom").append(Math.round(content.chomeur));
    $("#emplTxChom").append(Math.round(content.taux_chomage) + '%');
    Highcharts.chart('employment', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Emploi'
      },
      yAxis: {
        title: {
          text: 'Nombre'
        }
      },
      xAxis: {
        categories: ['actif', 'inactif', 'chomeur', 'étudiant', 'retraité'],
      },
      tooltip: {
        pointFormat: "Nombre: {point.y:.2f}"
      },
      series: [{
        name: "activité",
        color: "#fb8072",
        data: [
          content.actif,
          content.inactif,
          content.chomeur,
          content.etudiant,
          content.retraite]
      }]
    } );
  } );
} );

// Actvite / employment by sex
$(document).ready(function() {
  var iris_code = document.getElementById("employmentSex").dataset.iris;
  $.get("/api/insee/activite/distribution/" + iris_code + "?by=sex", function (content) {
    Highcharts.chart('employmentSex', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Emploi par sexe'
      },
      yAxis: {
        title: {
          text: 'Nombre'
        }
      },
      xAxis: {
        categories: ['actif', 'inactif', 'chomeur', 'étudiant', 'retraité'],
      },
      tooltip: {
        pointFormat: "Nombre: {point.y:.2f}"
      },
      series: [{
        "name": "Female",
        "data": [content.data.femme_actif,
                 content.data.femme_inactif,
                 content.data.femme_chomage,
                 content.data.femme_etudiant,
                 content.data.femme_retraite]
      }, {
        "name": "Male",
        "data": [content.data.homme_actif,
                 content.data.homme_inactif,
                 content.data.homme_chomage,
                 content.data.homme_etudiant,
                 content.data.homme_retraite]
      }]
    } );
  } );
} );



// Actvite / employment by age
$(document).ready(function() {
  var iris_code = document.getElementById("employmentAge").dataset.iris;
  $.get("/api/insee/activite/distribution/" + iris_code + "?by=age", function (content) {
    Highcharts.chart('employmentAge', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Emploi par âge'
      },
      yAxis: {
        title: {
          text: 'Nombre'
        }
      },
      xAxis: {
        categories: ['15-24', '25-54', '55-64'],
      },
      tooltip: {
        pointFormat: "Nombre: {point.y:.2f}"
      },
      series: [{
        "name": "Actif",
        "data": [content.data.actif_15_24,
                 content.data.actif_25_54,
                 content.data.actif_55_64]
      }, {
        "name": "Chomage",
        "data": [content.data.chomage_15_24,
                 content.data.chomage_25_54,
                 content.data.chomage_55_64]
      }]
    } );
  } );
} );
