function initChecking() {
    valueInteraction();
}

function valueInteraction() {
    let passwordStatus = document.getElementById("password");
    let verifyStatus = document.getElementById("verifyPassword");

    passwordStatus.addEventListener("keyup", checkPasswords);
    verifyStatus.addEventListener("keyup", checkPasswords);
}

function checkPasswords() {
    let passwordStatus = document.getElementById("password");
    let verifyStatus = document.getElementById("verifyPassword");

    if (passwordStatus.value !== verifyStatus.value){
        passwordStatus.className = "form-control is-invalid";
        verifyStatus.className = "form-control is-invalid";
    }

    else {
        passwordStatus.className = "form-control is-valid";
        verifyStatus.className = "form-control is-valid";
    }
}