document.addEventListener("DOMContentLoaded", function () {
  const btn = document.getElementById("btn");
  const msg = document.getElementById("pError");

  btn.addEventListener("click", function (event) {
    event.preventDefault();

    const dobValue = document.getElementById("dob").value; 

    if (!dobValue) {
      msg.innerHTML = "Please select your date of birth!";
      msg.style.color = "red";
      return;
    }

    const parts = dobValue.split("-");
    const year = parseInt(parts[0], 10);

    if (year < 1900 || year > 2016) {
      msg.innerHTML = "Year must be between 1900 and 2016!";
      msg.style.color = "red";
      return;
    }

    msg.innerHTML = "Date of Birth is valid!";
    msg.style.color = "green";
  });
});
