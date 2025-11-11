document.addEventListener("DOMContentLoaded", function () {
  const btn = document.getElementById("btn");
  const msg = document.getElementById("pError");

  btn.addEventListener("click", function (event) {
    event.preventDefault();
    const degreeCheckboxes = document.getElementsByName("degree");
    let isChecked = false;
    for (let i = 0; i < degreeCheckboxes.length; i++) {
      if (degreeCheckboxes[i].checked) {
        isChecked = true;
        break;
      }
    }

    if (!isChecked) {
      msg.innerHTML = "Please select at least one degree!";
      msg.style.color = "red";
      return;
    }
    msg.innerHTML = "Degree selection is valid!";
    msg.style.color = "green";
  });
});