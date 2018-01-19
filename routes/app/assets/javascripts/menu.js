$(document).ready(function() {
  attachListeners();
});

function attachListeners() {
    $('#mapsButton').on('click', () => mapButtons());
    $('#landmarksButton').on('click', () => landmarkButtons());
    $('#categoriesButton').on('click', () => categoryButtons());

}

function mapButtons() {
    $.get('/maps', (mapList) => {
        //debugger
        if (mapList.data.length) {
            mapList.data.forEach(buttonizeMapList)
        }
    })

}

function landmarkButtons() {
    debugger
}

function categoryButtons() {
    debugger
}

function buttonizeMapList(map) {
    //debugger
    $('#maps').append(`<button id="mapID-${map.id}">${map.attributes.name}</button><br>`)
    $(`#mapID-${map.id}`).on('click', () => loadRoutes(map.id))
}

function loadRoutes(mapID) {
    const xhr = new XMLHttpRequest;
    //debugger 
    xhr.overrideMimeType('application/json');
    xhr.open('GET', `maps/${mapID}/routes`, true);
    xhr.onload = () => {
        debugger
        //const data = JSON.parse(xhr.responseText.data)
        //debugger 
    }
    
    xhr.send(null);
}
/*
  
  xhr.open('GET', `/games/${gameID}`, true);
  xhr.onload = () => {
    const data = JSON.parse(xhr.responseText).data;
    const id = data.id;
    const state = data.attributes.state;

    let index = 0;
    for (let y = 0; y < 3; y++) {
      for (let x = 0; x < 3; x++) {
        document.querySelector(`[data-x="${x}"][data-y="${y}"]`).innerHTML = state[index];
        index++;
      }
    }

    turn = state.join('').length;
    currentGame = id;

    
  };

  xhr.send(null);
}
*/

/*
  if (currentGame) {
    $.ajax({
      type: 'PATCH',
      url: `/games/${currentGame}`,
      data: gameData
    });
  } else {
    $.post('/games', gameData, function(game) {
      currentGame = game.data.id;
      $('#games').append(`<button id="gameid-${game.data.id}">${game.data.id}</button><br>`);
      $("#gameid-" + game.data.id).on('click', () => reloadGame(game.data.id));
    });
  }
*/


/*
<h2>Pick a map to edit:</h2>

<ul>
   <% @maps.each do |map| %>
    <li><%= button id="map" link_to map.name, map_path(map)%></li>
   <% end %>
 </ul>
*/