function initChecking() {
    valueInteraction();
}

function valueInteraction() {
    let passwordStatus = document.getElementById("registrationPassword");
    let verifyStatus = document.getElementById("registrationVerifyPassword");

    passwordStatus.addEventListener("keyup", checkPasswords);
    verifyStatus.addEventListener("keyup", checkPasswords);
}

function checkPasswords() {
    let passwordStatus = document.getElementById("registrationPassword");
    let verifyStatus = document.getElementById("registrationVerifyPassword");

    if (passwordStatus.value !== verifyStatus.value){
        passwordStatus.className = "form-control is-invalid";
        verifyStatus.className = "form-control is-invalid";
    }

    else {
        passwordStatus.className = "form-control is-valid";
        verifyStatus.className = "form-control is-valid";
    }
}