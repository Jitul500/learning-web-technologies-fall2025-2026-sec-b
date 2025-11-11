document.addEventListener("DOMContentLoaded", function () {
  const btn = document.getElementById("btn");
  const msg = document.getElementById("pError");

  btn.addEventListener("click", function (event) {
    event.preventDefault();
    const bloodgroupSelect = document.getElementById("bloodgroup");
    const selectedValue = bloodgroupSelect.value;
    if (selectedValue === "") {
      msg.innerHTML = "Please select a blood group!";
      msg.style.color = "red";
      return;
    }
    msg.innerHTML = "Blood group selection is valid!";
    msg.style.color = "green";
  });
});