document.addEventListener("DOMContentLoaded", function () {
  const btn = document.getElementById("btn");
  const msg = document.getElementById("pError");

  btn.addEventListener("click", function (event) {
    event.preventDefault();

    const genders = document.getElementsByName("gender");
    let isSelected = false;

    for (let i = 0; i < genders.length; i++) {
      if (genders[i].checked) {
        isSelected = true;
        break;
      }
    }

    if (!isSelected) {
      msg.innerHTML = "Please select your gender.";
      msg.style.color = "red";
    } else {
      msg.innerHTML = "Gender selected!";
      msg.style.color = "green";
    }
  });
});
