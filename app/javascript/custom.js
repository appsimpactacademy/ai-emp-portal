// Get status of application on modal popup
// Add event listeners to the buttons in the modal
var approveButton = document.querySelector(".status-btn");
approveButton.addEventListener("click", function() {
  debugger
  var statusText = this.textContent.replaceAll(' ', '',).replaceAll('\n', '');
  document.querySelector("#modal-status-text").value = statusText;
});
