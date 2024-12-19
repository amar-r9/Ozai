var room = 1;

function education_fields() {
  room++;
  var objTo = document.getElementById("education_fields");
  var divtest = document.createElement("div");
  divtest.setAttribute("class", "mb-3 removeclass" + room);
  var rdiv = "removeclass" + room;
  divtest.innerHTML =
    '<div class="row"><div class="col-6 form-group"><div class="mb-3 controls"><label class="control-label">Item</label><input type="text" class="form-control" name="item" placeholder="Item"></div></div><div class="col-6 form-group"><div class="mb-3 controls"><label class="control-label">Quantity</label><input type="text" class="form-control" name="quantity" placeholder="Quantity"> </div></div></div><div class="col-2"> <div class="form-group"> <button class="btn rounded-pill px-4 btn-light-danger text-danger font-weight-medium waves-effect waves-light" type="button" onclick="remove_education_fields(' +
    room +
    ');"> <i class="ri-delete-bin-line fs-5"></i> </button> </div></div>';

  objTo.appendChild(divtest);
  feather.replace();
}

function remove_education_fields(rid) {
  $(".removeclass" + rid).remove();
}
