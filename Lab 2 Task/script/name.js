document.addEventListener("DOMContentLoaded", function () {
  const btn = document.getElementById("btn");
  const usernameInput = document.getElementById("username");
  const msg = document.getElementById("pError");


  btn.addEventListener("click", function (event) {
    event.preventDefault();

    let username = usernameInput.value.trim();

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

    msg.innerHTML = "Name is valid!";
    msg.style.color = "green";
  });
});