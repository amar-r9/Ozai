// Countries
var city_arr = new Array("Hyderabad", "Bangalore", "Kolkata");

// States
var s_a = new Array();
s_a[0] = "";
s_a[1] = "Financial District|Gachibowli|Madhapur|Raidurgam|Nanakramguda|Tukkuguda|Shamshabad";
s_a[2] = "Marathahalli|Bellandur|Kundalahalli|Electronics City|Indiranagar|HSR Layout|JP Nagar|BTM Layout|Koramangla|KR Puram";
s_a[3] = "Dankuni";
/*s_a[4] = "1|2|3";
s_a[5] = "1|2|3";
s_a[6] = "1|2|3";*/


function populateLocations(cityElementId, locationElementId) {

    var selectedCityIndex = document.getElementById(cityElementId).selectedIndex;

    var locationElement = document.getElementById(locationElementId);

    locationElement.length = 0; // Fixed by Julian Woods
    locationElement.options[0] = new Option('Select Location', '');
    locationElement.selectedIndex = 0;

    var location_arr = s_a[selectedCityIndex].split("|");

    for (var i = 0; i < location_arr.length; i++) {
    	locationElement.options[locationElement.length] = new Option(location_arr[i], location_arr[i]);
    }
}
function populateHyderabadLocations(locationElementId) {

    var selectedCityIndex = 1;

    var locationElement = document.getElementById(locationElementId);

    locationElement.length = 0; // Fixed by Julian Woods
    locationElement.options[0] = new Option('Select Location', '');
    locationElement.selectedIndex = 0;

    var location_arr = s_a[selectedCityIndex].split("|");

    for (var i = 0; i < location_arr.length; i++) {
    	locationElement.options[locationElement.length] = new Option(location_arr[i], location_arr[i]);
    }
}

function populateCities(cityElementId, locationElementId) {
    // given the id of the <select> tag as function argument, it inserts <option> tags
    var cityElement = document.getElementById(cityElementId);
    cityElement.length = 0;
    cityElement.options[0] = new Option('Select City', '');
    cityElement.selectedIndex = 0;
    for (var i = 0; i < city_arr.length; i++) {
        cityElement.options[cityElement.length] = new Option(city_arr[i], city_arr[i]);
    }

    // Assigned all countries. Now assign event listener for the states.

    if (locationElementId) {
        cityElement.onchange = function () {
            populateLocations(cityElementId, locationElementId);
        };
    }
}