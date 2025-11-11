document.addEventListener("DOMContentLoaded", function () {
  btn.addEventListener("click", function (event) {
    event.preventDefault();

    let email = document.getElementById("email").value;
    let msg = document.getElementById("pError");
    let btn = document.getElementById("btn");

    if (email === "") {
      msg.innerHTML = "Please type your email first!";
      msg.style.color = "red";
    }

    if (
      !email.includes("@") || email.startsWith("@") || email.endsWith("@") ||                         
      !email.includes(".") || email.lastIndexOf(".") < email.indexOf("@") + 2 || email.endsWith(".") ) 
      {
      msg.innerHTML = "Please enter a valid email address!";
      msg.style.color = "red";
      return;
    }
    else {
      msg.innerHTML = "Email is valid!";
      msg.style.color = "green";
    }

  });
});