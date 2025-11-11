document.addEventListener("DOMContentLoaded", function () {
  const btn = document.getElementById("btn");
  const usernameInput = document.getElementById("username");
  const msg = document.getElementById("pError");

  btn.addEventListener("click", function (event) {
    event.preventDefault();

    let username = usernameInput.value.trim();
    let email = document.getElementById("email").value;

    if (username === "") {
      msg.innerHTML = "Please type your name first!";
      msg.style.color = "red";
      return;
    }

    if (username.split(" ").length < 2) {
      msg.innerHTML = "Name must contain at least two words.";
      msg.style.color = "red";
      return;
    }

    const firstChar = username.charAt(0);
    if (!((firstChar >= 'A' && firstChar <= 'Z') || (firstChar >= 'a' && firstChar <= 'z'))) {
      msg.innerHTML = "Name must start with a letter.";
      msg.style.color = "red";
      return;
    }

    for (let i = 0; i < username.length; i++) {
      const ch = username.charAt(i);
      const isLetter = (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z');
      const isAllowed = isLetter || ch === '.' || ch === '-' || ch === ' ';

      if (!isAllowed) {
        msg.innerHTML = "Name can only contain letters, dot (.), dash (-), or spaces.";
        msg.style.color = "red";
        return;
      }
    }
    if (email === "") {
      msg.innerHTML = "Please type your email first!";
      msg.style.color = "red";
      return;
    }

    if (
      !email.includes("@") || email.startsWith("@") || email.endsWith("@") ||                         
      !email.includes(".") || email.lastIndexOf(".") < email.indexOf("@") + 2 || email.endsWith(".") ) 
      {
      msg.innerHTML = "Please enter a valid email address!";
      msg.style.color = "red";
      return;
    }
   
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
      return;
    }

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

    const bloodgroupSelect = document.getElementById("bloodgroup");
    const selectedValue = bloodgroupSelect.value;
    if (selectedValue === "") {
      msg.innerHTML = "Please select a blood group!";
      msg.style.color = "red";
      return;
    }

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

    const pictureInput = document.getElementById("picture");

    if (pictureInput.files.length === 0) {
      msg.innerHTML = "Please upload a profile picture!";
      msg.style.color = "red";
      return; 
    }

    msg.innerHTML = "Form submitted successfully!";
    msg.style.color = "green";

  });
});