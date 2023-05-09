function validation() {
    let testName = validateName();
    let testEmail = validateEmail();

    return testName && testEmail;
}

function validateName() {
    let nameObject = document.querySelector('#name');
    let namePattern = /^[A-Z][a-zñ]+$/;
    // dixar un espai vol dir que es descent, vol dir que span esta dins la label
    let errorMessage = document.querySelector('label[for="name"] span');

    if (nameObject.value.length === 0) {
        errorMessage.innerHTML = "Obliatory";
        errorMessage.style.color = "red";
        return false;
    }

    if (!namePattern.test(nameObject.value)) {
        errorMessage.innerHTML = "Inncorrect";
        errorMessage.style.color = "orange";
        return false;
    }

    nameObject.innerHTML = "";
    return true;
}

function validateEmail() {
    let emailObject = document.querySelector('#email');
    let emailPattern = /^[a-z]{3,}@[a-z]{3,}[.][a-z]{2,4}$/;
    // dixar un espai vol dir que es descent, vol dir que span esta dins la label
    let errorMessage = document.querySelector('label[for="email"] span');

    if (nameObject.value.length === 0) {
        errorMessage.innerHTML = "Obliatory";
        errorMessage.style.color = "red";
        return false;
    }

    if (!emailPattern.test(nameObject.value)) {
        errorMessage.innerHTML = "Inncorrect";
        errorMessage.style.color = "orange";
        return false;
    }

    nameObject.innerHTML = "";
    return true;
}
