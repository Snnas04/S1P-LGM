function validation() {
    let name = validar_text('div.Name input', /^[A-Z][a-z]+( ((de|de la|del) )?[A-Z]([a-z]+|\.))?( ((de|de la|del) )?[A-Z][a-z]+){1,2}$/, 'div.Name span');
    let user = validar_text('div.User input', /^[A-Z][a-z]+$/, 'div.User span');
    let email = validar_text('div.eMail input', /^[a-z]{3,}(([._-])[a-z]{3,})?(\2[a-z]{3,})*@[a-z]{3,}\.[a-z]{2,4}$/, 'div.eMail span');
    let aficions = validar_checkbox();
    let genere = validar_radio();

    return name && user && email && aficions && genere;
}

function validar_text(elementSelector, pattern, messageSelector) {
    let element = document.querySelector(elementSelector);
    let message = document.querySelector(messageSelector);

    if (element.value.length === 0) {
        message.innerHTML = "Obligatori";
        message.style.color = "red";
        return false;
    }

    if (!pattern.test(element.value)) {
        message.innerHTML = "Incorrecte";
        message.style.color = "orange";
        return false;
    }

    message.innerHTML = "";
    return true;
}

function validar_checkbox() {
    let element = document.querySelector('div.topics input');
    let message = document.querySelector('div.topics span');

    let min = 2;
    let max = 4;
    let contador = 0;
    for (let i = 0; i < element.length; i++) {
        if (element[i].checked) {
            contador++;
        }
    }

    if (contador < min) {
        message.innerHTML = "Mínim has de marcar" + (min - contador) + "més";
        message.style.color = "red";
        return false;
    }
    if (contador > max) {
        message.innerHTML = "Màxim pots marcar" + max + ", has de desmarcar" + (contador - max);
        message.style.color = "red";
        return false;
    }

    message.innerHTML = "";
    return true;
}

function validar_radio() {
    let element = document.querySelector('div.topics input');
    let message = document.querySelector('div.topics span');

    let contador = 0;
    for (let i = 0; i < element.length; i++) {
        if (element[i].checked) {
            contador++;
        }
    }

    message.innerHTML = "";
    return true;
}
