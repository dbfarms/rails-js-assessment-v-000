$(document).ready(function() {
  attachListeners();
});

function attachListeners() {
    $('#mapsButton').on('click', () => mapButtons());
    $('#landmarksButton').on('click', () => landmarkButtons());
    $('#categoriesButton').on('click', () => categoryButtons());
    $('.showlandmark').on('click', (event) => showLandmark(event));
    //$('form.route').on('click', () => routeObject());
    //$('form.route').onsubmit = routeObject();
    //$('form.landmark').on('click', () => landmarkObject());

}

function RouteObject(thisRoute){
  //debugger
  this.name = thisRoute.data.attributes.name
  this.rating = thisRoute.data.attributes.rating 
  this.landmarks = thisRoute["data"]["relationships"]["landmarks"]["data"]
  
}

Handlebars.registerHelper('list', function(items, options) {
  var out = "<ul>";

  for(var i=0, l=items.length; i<l; i++) {
    out = out + "<li>" + options.fn(items[i]) + "</li>";
  }

  return out + "</ul>";
});


RouteObject.prototype.returnTemplate = function (){
  var template = Handlebars.compile(document.getElementById("route-template").innerHTML);
  return template(this)
}


function landmarkObject(){
  debugger
}

function showLandmark(){
  event.preventDefault();
  var id = event.currentTarget.dataset.id
  $.get('/landmarks/' + id + ".json", function(data) {
        //debugger
        var lm = data["data"]["attributes"]
        newLandmark = new LandmarkItem(lm)
        var result = newLandmark.returnTemplate()
        document.getElementById("landmarkHere").innerHTML = result;
      })
}

function LandmarkItem(attributes) {
  this.name = attributes.name
  this.lmHistory = attributes.history 
}

LandmarkItem.prototype.returnTemplate = function (){
  var template = Handlebars.compile(document.getElementById("lm-template").innerHTML);
  return template(this)
}


/*
<script id="lm-template" type="text/x-handlebars-template">
  <article>
    <header><h3>Landmark Name: {{name}}</h3></header>
    <p>Landmark history: {{history}}</p>
  </article>
</script>
*/


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

