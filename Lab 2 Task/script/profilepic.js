document.addEventListener("DOMContentLoaded", function () {
  const btn = document.getElementById("btn");
  const msg = document.getElementById("pError");
  btn.addEventListener("click", function (event) {
    event.preventDefault();
    const userIdInput = document.getElementById("userid");
    const pictureInput = document.getElementById("picture");
    const userIdValue = userIdInput.value.trim();

    if (userIdValue === "") {
      msg.innerHTML = "User ID cannot be empty!";
      msg.style.color = "red";
      return; 
    }

    if (isNaN(userIdValue) || Number(userIdValue) <= 0) {
      msg.innerHTML = "User ID must be a positive number!";
      msg.style.color = "red";
      return; 
    }

    if (pictureInput.files.length === 0) {
      msg.innerHTML = "Please upload a profile picture!";
      msg.style.color = "red";
      return; 
    }

    msg.innerHTML = "Profile picture uploaded successfully!";
    msg.style.color = "green";
  });
});