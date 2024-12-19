// Categories
var sub_arr = new Array("Room","Washroom", "Tap","Shower","Gun","WC","Light","Fan","Geyser","Switch Board","AC","Not Sufficient","Taste","Quality","Parking","Activity Area","Bed","Cupboard","TV","DTH","Broadband","Drinking Water","Table/Chair","Wall Cloth Hanger","Curtain","Security");

// Sub Categories
var i_a = new Array();
i_a[0] = "";
i_a[1] = "Room|Washroom|";
i_a[2] = "Tap|Shower|Gun|WC";
i_a[3] = "Light|Fan|Geyser|Switch Board|AC";
i_a[4] = "Not Sufficient|Taste|Quality";
i_a[5] = "Parking|Activity Area";
i_a[6] = "Bed|Cupboard|TV|DTH|Broadband|Drinking Water|Table/Chair|Wall Cloth Hanger|Curtain|Security";
i_a[7] = "Room|Washroom|";
i_a[8] = "Tap|Shower|Gun|WC";
i_a[9] = "Light|Fan|Geyser|Switch Board|AC";
i_a[10] = "Not Sufficient|Taste|Quality";
i_a[11] = "Parking|Activity Area";
i_a[12] = "Bed|Cupboard|TV|DTH|Broadband|Drinking Water|Table/Chair|Wall Cloth Hanger|Curtain|Security";
i_a[13] = "Room|Washroom|";
i_a[14] = "Tap|Shower|Gun|WC";
i_a[15] = "Light|Fan|Geyser|Switch Board|AC";
i_a[16] = "Not Sufficient|Taste|Quality";
i_a[17] = "Parking|Activity Area";
i_a[18] = "Bed|Cupboard|TV|DTH|Broadband|Drinking Water|Table/Chair|Wall Cloth Hanger|Curtain|Security";
i_a[19] = "Room|Washroom|";
i_a[20] = "Tap|Shower|Gun|WC";
i_a[21] = "Light|Fan|Geyser|Switch Board|AC";
i_a[22] = "Not Sufficient|Taste|Quality";
i_a[23] = "Parking|Activity Area";
i_a[24] = "Bed|Cupboard|TV|DTH|Broadband|Drinking Water|Table/Chair|Wall Cloth Hanger|Curtain|Security";
i_a[25] = "Light|Fan|Geyser|Switch Board|AC";
i_a[26] = "Not Sufficient|Taste|Quality";


function populateIssue(subElementId, issueElementId) {

    var selectedSubIndex = document.getElementById(subElementId).selectedIndex;

    var issueElement = document.getElementById(issueElementId);

    issueElement.length = 0; // Fixed by Julian Woods
    issueElement.options[0] = new Option('Select issue', '');
    issueElement.selectedIndex = 0;

    var issue_arr = i_a[selectedSubIndex].split("|");

    for (var i = 0; i < issue_arr.length; i++) {
        issueElement.options[issueElement.length] = new Option(issue_arr[i], issue_arr[i]);
    }
}