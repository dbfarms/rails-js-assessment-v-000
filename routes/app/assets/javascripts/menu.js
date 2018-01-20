$(document).ready(function() {
  attachListeners();
});

function attachListeners() {
    $('#mapsButton').on('click', () => mapButtons());
    $('#landmarksButton').on('click', () => landmarkButtons());
    $('#categoriesButton').on('click', () => categoryButtons());
    //$('#routesButton').on('click', () => routeButtons())

}

function mapButtons() {
    $.get('/maps', (mapList) => {
        //debugger
        var maps = $('#maps').html()
        
        if (mapList.data.length && maps === "") {
            mapList.data.forEach(buttonizeMapList)
        } else if (maps !== "") {
          document.getElementById('maps').innerHTML = ""
        }
    })
}

function landmarkButtons() {
    $.get('/landmarks', (landmarkList) => {
      var lms = $('#landmarks').html()
      //debugger
      if (landmarkList.data.length && lms === "") {
        landmarkList.data.forEach(buttonizeLandmarkList)
      } else if (lms !== "") {
        document.getElementById('landmarks').innerHTML = ""
      }
    })
}

function buttonizeLandmarkList(landmark) {
  $('#landmarks').append(`<button id="landmarkID-${landmark.id}">${landmark.attributes.name}</button>`)
  
  $(`#landmarkID-${landmark.id}`).click(function() {
    window.location=`landmarks/${landmark.id}/routes`
  })
}


function buttonizeMapList(map) {
    $('#maps').append(`<button id="mapID-${map.id}">${map.attributes.name}</button><br>`)
    $(`#mapID-${map.id}`).click(function(){
        window.location=`maps/${map.id}/routes`
    });
};


function LandmarkItem(attributes) {
  this.name = attributes.name
  this.id = attributes.id
  //history is a reserve word?
}

LandmarkItem.prototype.returnTemplate = function (){
  return LandmarkItem.template(this)
}

Handlebars.registerHelper("debug", function(optionalValue) {
  console.log("Current Context");
  console.log("====================");
  console.log(this);
 
  if (optionalValue) {
    console.log("Value");
    console.log("====================");
    console.log(optionalValue);
  }
});