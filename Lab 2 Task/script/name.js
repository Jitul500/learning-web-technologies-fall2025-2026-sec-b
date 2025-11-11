document.addEventListener("DOMContentLoaded", function() {
    const btn = document.getElementById("btn");
    const usernameInput = document.getElementById("username");
    const msg = document.getElementById("pError");
    

    btn.addEventListener("click", function(event) {
        event.preventDefault();

        let username = usernameInput.value.trim();

        if (username === "") {
            msg.innerHTML = "Please type your name first!";
            msg.style.color = "red";
        }
        else if (username.split(" ").length < 2) {
            msg.innerHTML = "Name must contain at least two words.";
            msg.style.color = "red";
        }
        else if (!/^[a-zA-Z][a-zA-Z.\-\s]*$/.test(username)) {
            msg.innerHTML = "Name must start with a letter and can contain letters, dot (.), or dash (-).";
            msg.style.color = "red";
        }
        else {
            msg.innerHTML = "Name is valid!";
            msg.style.color = "green";
            
        }
    });
});
