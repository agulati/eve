$(".edit").on("click", function (e) {
  key = $($(this)[0]).parent().children("input")[0].value
  window.location = "places/" + key + "/edit"
})

$(".delete").on("click", function (e) {
  alert("delete")
})
