// Categories
var category_arr = new Array("House Keeping", "Plumbing", "Electrical", "Food", "Common Area", "Amenities", "Transport");

// Sub Categories
var s_a = new Array();
s_a[0] = "";
s_a[1] = "Room|Washroom";
s_a[2] = "Tap|Shower|Gun|WC";
s_a[3] = "Light|Fan|Geyser|Switch Board|AC";
s_a[4] = "Breakfast|Lunch|Dinner";
s_a[5] = "Parking|Activity Area";
s_a[6] = "Bed|Cupboard|TV|DTH|Broadband|Drinking Water|Table/Chair|Wall Cloth Hanger|Curtain|Security";
s_a[7] = "Driver Related|Vehicle Related";


var i_a = new Array();
i_a[0] = "";
i_a[1] = "Not Done|Not Done Properly";
i_a[2] = "Not Working|Leakage";
i_a[3] = "Not Working";
i_a[4] = "Not Sufficient|Taste|Quality";
i_a[5] = "Not Clean|Repair/Service";
i_a[6] = "Damage|Report Incident";
i_a[7] = "Vehicle Breakdown|Rash Driving|Different Route|Vehicle wasn't clean";

function populateIssue(categoryElementId, issueElementId) {

    var selectedCategoryIndex = document.getElementById(categoryElementId).selectedIndex;

    var issueElement = document.getElementById(issueElementId);

    issueElement.length = 0; // Fixed by Julian Woods
    issueElement.options[0] = new Option('Select issue', '');
    issueElement.selectedIndex = 0;

    var issue_arr = i_a[selectedCategoryIndex].split("|");

    for (var i = 0; i < issue_arr.length; i++) {
        issueElement.options[issueElement.length] = new Option(issue_arr[i], issue_arr[i]);
    }
}

function populateSub(categoryElementId, subElementId, issueElementId) {

    var selectedCategoryIndex = document.getElementById(categoryElementId).selectedIndex;

    var subElement = document.getElementById(subElementId);

    subElement.length = 0; // Fixed by Julian Woods
    subElement.options[0] = new Option('Select sub category', '');
    subElement.selectedIndex = 0;

    var sub_arr = s_a[selectedCategoryIndex].split("|");

    for (var i = 0; i < sub_arr.length; i++) {
        subElement.options[subElement.length] = new Option(sub_arr[i], sub_arr[i]);
    }
    
    if (issueElementId) {
    	subElement.onchange = function () {
            populateIssue(categoryElementId, issueElementId);
        };
    }
}

function populateCategories(categoryElementId, subElementId, issueElementId) {
    // given the id of the <select> tag as function argument, it inserts <option> tags
    var categoryElement = document.getElementById(categoryElementId);
    categoryElement.length = 0;
    categoryElement.options[0] = new Option('Select Category', '');
    categoryElement.selectedIndex = 0;
    for (var i = 0; i < category_arr.length; i++) {
    	categoryElement.options[categoryElement.length] = new Option(category_arr[i], category_arr[i]);
    }

    // Assigned all countries. Now assign event listener for the states.

    if (subElementId) {
    	categoryElement.onchange = function () {
            populateSub(categoryElementId, subElementId, issueElementId);
        };
    }
}