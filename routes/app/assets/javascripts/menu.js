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
    $.get('/landmar')
}

function categoryButtons() {
    debugger
    //make this a link too
}

function buttonizeMapList(map) {
    //debugger
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