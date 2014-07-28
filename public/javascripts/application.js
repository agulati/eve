$(".edit").on("click", function (e) {
  key = $($(this)[0]).parent().children("input")[0].value
  window.location = "places/" + key + "/edit"
})

$(".add").on("click", function (e) {
  window.location = "places/new"
})

$(".delete").on("click", function (e) {
  key = $($(this)[0]).parent().children("input")[0].value
  window.location = "places/" + key + "/delete"
})
