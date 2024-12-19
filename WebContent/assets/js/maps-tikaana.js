//If you're adding a number of markers, you may want to drop them on the map
	//consecutively rather than all at once. This example shows how to use
	//window.setTimeout() to space your markers' animation.
	const neighborhoods = [
		{ lat: 17.42742967884128, lng: 78.3250321835587 },   //Nile   1
		{ lat: 17.426996070135825, lng: 78.3249319835587 },   //Abode   2
		{ lat: 17.743049667134382, lng: 83.331005383937 },    //Vizag   3
		{ lat: 17.426552897716626, lng: 78.32438101054258 },   //Fort   4
	 	{ lat: 17.426181643727954, lng: 78.3249946105426 },   //Adhira   5
	 	{ lat: 17.42712387002106, lng: 78.32491911054252 },   //Finke   6
	 	{ lat: 28.288386666877233, lng: 76.86132963995043},   //Bilaspur   7
	 	{ lat: 19.23883647493952, lng: 73.04315849745119},    //Mumbai     8
	 	{ lat: 12.861885470136016, lng: 77.3954909950847},   //Bidadi      9
	 	{ lat: 22.68619351102453, lng: 88.29373098216512},    //Dankuni    10
	 	{ lat: 14.438050804906094, lng: 79.98959769738582},   //Nellore    11
	 	{ lat: 17.475866794694113, lng: 78.36496654660974},   //Ferlo (Kims)    12
	 	{ lat: 17.461263056562235, lng: 78.3094911974249 },   //Citizens    13
	 	{ lat: 21.71102662131488, lng: 72.65341489749181},    //DTSS Dahej   14
	 	{ lat: 17.447179983096984, lng: 78.38074531406352},    //Medicover Hyd
	 	{ lat: 17.42116864884375, lng: 78.38240060372921},     //Raidurgam 1
	 	{ lat: 17.42099213215887, lng: 78.38235754275176},     //Raidurgam 2
	 	{ lat: 17.45389539827084, lng: 78.37043456858879},    //BN Reddy
	 	{ lat: 17.427770060287767, lng: 78.33263455509649},   //Q City
	 	{ lat: 17.44024993348522, lng: 78.3833848974246},     //Urbane Girls
	 	{ lat: 17.440328969064296, lng: 78.38299762440852},   //Urbane Boys
	 	{ lat: 17.441872645641702, lng: 78.44595483975264},   //SR Nagar
	];
	let markers = [];
	let map;
	
	function initMap() {
		map = new google.maps.Map(document.getElementById("map"), {
			zoom: 4,
		 	center: { lat: 22.048324116674237, lng: 78.04427069849939 },
	});
	//document.getElementById("drop").addEventListener("click", drop);
		setTimeout(drop, 3000);
	
		 map.setOptions({ styles: styles["hide"] });
		
	}
	
	function drop() {
	clearMarkers();
	
	for (let i = 0; i < neighborhoods.length; i++) {
	 addMarkerWithTimeout(neighborhoods[i], i * 300);
	}
	}
	
	function addMarkerWithTimeout(position, timeout) {
	window.setTimeout(() => {
	 markers.push(
	   new google.maps.Marker({
	     position: position,
	     map,
	     label: {
	         text: "\uf1f1",
	         fontFamily: "Material Icons",
	         color: "#ffffff",
	         fontSize: "24px",
	       },
	       //title: "Material Icon Font Marker",
	       animation: google.maps.Animation.DROP,
	   })
	 );
	}, timeout);
	}
	
	function clearMarkers() {
	for (let i = 0; i < markers.length; i++) {
	 markers[i].setMap(null);
	}
	
	markers = [];
	}
	const styles = {
	  default: [],
	  hide: [
	    {
	      featureType: "poi.business",
	      stylers: [{ visibility: "off" }],
	    },
	    {
	      featureType: "transit",
	      elementType: "labels.icon",
	      stylers: [{ visibility: "off" }],
	    },
	  ],
	};